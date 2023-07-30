;===============================================================
;		Music file for NES Sound Driver & Library
;			for assembly language (ca65.exe)
;===============================================================

	.export		DQBGM0


.segment	"RODATA"
DQSUB0:
	.byte	$08 ,$78
	.byte	$6c
	.byte	$3c
	.byte	$a0 ,$12
	.byte	$a0 ,$06
	.byte	$85
	.byte	$87
	.byte	$89
	.byte	$8a
	.byte	$29
	.byte	$80
	.byte	$a5 ,$30
	.byte	$a4 ,$12
	.byte	$a2 ,$06
	.byte	$a2 ,$24
	.byte	$a0 ,$0c
	.byte	$af ,$0c
	.byte	$28
	.byte	$ab ,$0c
	.byte	$ab ,$0c
	.byte	$29
	.byte	$a2 ,$0c
	.byte	$80
	.byte	$28
	.byte	$a9 ,$30
	.byte	$00
DQSUB1:
	.byte	$08 ,$78
	.byte	$6c
	.byte	$aa ,$12
	.byte	$aa ,$06
	.byte	$89
	.byte	$29
	.byte	$80
	.byte	$85
	.byte	$85
	.byte	$a5 ,$30
	.byte	$a5 ,$30
	.byte	$aa ,$24
	.byte	$a9 ,$0c
	.byte	$af ,$0c
	.byte	$a8 ,$0c
	.byte	$a8 ,$0c
	.byte	$ab ,$0c
	.byte	$89
	.byte	$a5 ,$30
	.byte	$00
DQSUB2:
	.byte	$08 ,$78
	.byte	$8f
	.byte	$85
	.byte	$84
	.byte	$83
	.byte	$82
	.byte	$28
	.byte	$a9 ,$30
	.byte	$aa ,$30
	.byte	$29
	.byte	$85
	.byte	$80
	.byte	$28
	.byte	$85
	.byte	$29
	.byte	$85
	.byte	$85
	.byte	$28
	.byte	$89
	.byte	$29
	.byte	$80
	.byte	$85
	.byte	$00
DQBGM0:
	.byte	$03, $0
	.word	$0008 ,$000c ,$0010
	.byte	$02 ,$96 ,$ff
	.byte	$00
	.byte	$02 ,$b9 ,$ff
	.byte	$00
	.byte	$02 ,$d5 ,$ff
	.byte	$00
