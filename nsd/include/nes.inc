;
; NES definitions
;

.ifndef	__NES_INC__

.define	__NES_INC__

;; PPU defines
PPU_CTRL1	= $2000
PPU_CTRL2	= $2001
;PPU_STATUS	= $2002
PPU_SPR_ADDR	= $2003
PPU_SPR_IO  	= $2004
PPU_VRAM_ADDR1	= $2005
PPU_VRAM_ADDR2	= $2006
PPU_VRAM_IO	= $2007

;; APU defines
APU_PULSE1CTRL  = $4000         ; Pulse #1 Control Register (W)
APU_PULSE1RAMP  = $4001         ; Pulse #1 Ramp Control Register (W)
APU_PULSE1FTUNE = $4002         ; Pulse #1 Fine Tune (FT) Register (W)
APU_PULSE1CTUNE = $4003         ; Pulse #1 Coarse Tune (CT) Register (W)
APU_PULSE2CTRL  = $4004         ; Pulse #2 Control Register (W)
APU_PULSE2RAMP  = $4005         ; Pulse #2 Ramp Control Register (W)
APU_PULSE2FTUNE = $4006         ; Pulse #2 Fine Tune Register (W)
APU_PULSE2STUNE = $4007         ; Pulse #2 Coarse Tune Register (W)
APU_TRICTRL1    = $4008         ; Triangle Control Register #1 (W)
APU_TRICTRL2    = $4009         ; Triangle Control Register #2 (?)
APU_TRIFREQ1    = $400A         ; Triangle Frequency Register #1 (W)
APU_TRIFREQ2    = $400B         ; Triangle Frequency Register #2 (W)
APU_NOISECTRL   = $400C         ; Noise Control Register #1 (W)
;;APU_ = $400D  ; Unused (???)
APU_NOISEFREQ1  = $400E         ; Noise Frequency Register #1 (W)
APU_NOISEFREQ2  = $400F         ; Noise Frequency Register #2 (W)
APU_MODCTRL     = $4010         ; Delta Modulation Control Register (W)
APU_MODDA       = $4011         ; Delta Modulation D/A Register (W)
APU_MODADDR     = $4012         ; Delta Modulation Address Register (W)
APU_MODLEN      = $4013         ; Delta Modulation Data Length Register (W)
APU_SPR_DMA    	= $4014         ; Sprite DMA Register (W)
APU_CHANCTRL   	= $4015         ; Sound/Vertical Clock Signal Register (R)
APU_PAD1       	= $4016         ; Joypad #1 (RW)
APU_PAD2	= $4017         ; Joypad #2/SOFTCLK (RW)

.endif
