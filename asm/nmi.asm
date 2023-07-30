; NMI処理

.import _nsd_main
.import _nsd_play_bgm

;*------------------------------------------------------------------------------
; PPU_UPDATE_DATAを読み取り，指定アドレスに書き込んでカウンタをインクリメント
; store Data To PPU
; @PARAM ADDR ストア先
; @BREAK A, X
; @RETURN void
;*------------------------------------------------------------------------------
.macro ppuUpdDtTfrInx ADDR
	lda PPU_UPDATE_DATA, x
	sta ADDR
	inx
.endmacro

		.import DQBGM0
bgm0:
		.addr	DQBGM0

.proc NMI
		registerSave

		lda $ef
		beq @SKIP
		lda	DQBGM0
		ldx	DQBGM0 + 1
		jsr	_nsd_play_bgm
@SKIP:
		lda #0
		sta $ef

		registerLoad
		rti	; --------------------------
.endproc
