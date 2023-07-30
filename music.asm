.setcpu "6502"
.feature c_comments
.autoimport on

.include "const.inc"
.include "palette.inc"
.include "const_addr.inc"
.include "var_addr.inc"

.include "nes.inc"
.include "nsd.inc"
.import _nsd_main
.import _nsd_play_bgm
.global _nsd_main
.global _nsd_play_bgm

.include "ppu.asm"
.include "macro.asm"
.include "init.asm"
.include "nmi.asm"

.segment "HEADER"
		.byte $4e, $45, $53, $1a
		.byte $02						; プログラムバンク
		.byte $01						; キャラクターバンク
		.byte $01						; 垂直ミラー
		.byte $00
		.byte $00, $00, $00, $00
		.byte $00, $00, $00, $00

.segment "STARTUP"
.proc RESET
		init

		.include "main.asm"
.endproc

.proc IRQ
		rti
.endproc

.segment "CHARS"
		.incbin "spr_bg.chr"

.segment "VECINFO"
		.word NMI
		.word RESET
		.word IRQ