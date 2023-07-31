		.import DQBGM0
bgm0:
		.addr	DQBGM0

.macro init
	sei									; IRQ禁止
	cld									; BCD禁止
	; NesDevではAPUのフレームIRQを無効にしているが，特定のマッパーでのみ有効
	ldx #$ff
	txs
	inx
	stx $2000							; NMI無効化
	stx $2001							; 描画停止
	;stx $4010							; APU DMCのIRQ（bit7）無効化

	/*
	A & $2002の結果でZ（ゼロフラグ）設定
	$2002のbit7 -> N（ネガティブフラグ）, bit6 -> V（オーバーフロー）に入る
	$2002のbit7にはVblank，bit6は0爆弾の状態が入っている
	リセット後のこのフラグは，状態が不定なので，一回bit命令でリセットが出来るらしい
	*/
	bit $2002

	; Vblank待機1回目
@VBLANK_WAIT1:
	bit $2002
	bpl @VBLANK_WAIT1

	; PPUが安定するまで約30,000サイクルの時間がある -> この間にRAMリセット

	txa									; X = A = 0
@CLR_MEM:
	sta $00, x
	sta $0100, x
	sta $0200, x
	sta $0400, x
	sta $0500, x
	sta $0600, x
	sta $0700, x
	inx
	bne @CLR_MEM

	lda #$ff
@CLR_CHR_MEM:
	sta $0300, x
	inx
	bne @CLR_CHR_MEM

	; ここで必要なメモリの初期化

	; Vblank待機2回目
@VBLANK_WAIT2:
	bit $2002
	bpl @VBLANK_WAIT2

	; パレットテーブル転送
	lda #>PLT_TABLE_ADDR				; HIGH
	sta PPU_ADDR
	lda #<PLT_TABLE_ADDR				; LOW
	sta PPU_ADDR
	tax
@TFR_PAL:								; TFR = transfar
	lda DEFAULT_PLT, x
	sta PPU_DATA
	inx
	cpx #$20
	bne @TFR_PAL

	lda #0
	sta OAM_ADDR
	lda #$03
	sta OAM_DMA

	lda SOUND_CHANNEL
	ora #%00000001
	sta SOUND_CHANNEL
	lda #%10011111
	sta SOUND_CH1_1						; Duty50%(2)、ループ無し、音響固定、ボリューム最大(4)
	lda #%00000000
	sta SOUND_CH1_2						; 周波数変化なし（bit7）、他は設定せず

	jsr _nsd_init

	lda	bgm0
	ldx	bgm0 + 1
	jsr	_nsd_play_bgm

	; スクリーンON
	lda #%10010000						; |NMI-ON|PPU=MASTER|SPR8*8|BG$1000|SPR$0000|VRAM+1|SCREEN$2000|
	sta ppu_ctrl_cpy
	lda #%00011110						; |R|G|B|DISP-SPR|DISP-BG|SHOW-L8-SPR|SHOW-L8-BG|MODE=COLOR|
	sta ppu_mask_cpy
	restorePPUSet

	jsr setScroll

.endmacro