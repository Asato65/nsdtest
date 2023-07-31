; NMI処理

.import _nsd_main_bgm

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

.proc NMI
		registerSave

		inc frm_cnt
		jsr _nsd_main_bgm

		registerLoad
		rti	; --------------------------
.endproc
