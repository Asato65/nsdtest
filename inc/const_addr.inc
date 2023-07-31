ZP					= $00
CHR_DATA			= $0300
MAP1_DATA			= $0400
MAP2_DATA			= $0500
PPU_UPDATE_DATA		= $0600

PLT_TABLE_ADDR		= $3f00

PPU_CTRL			= $2000
PPU_MASK			= $2001
PPU_STATUS			= $2002
OAM_ADDR			= $2003
OAM_DATA			= $2004
PPU_SCROLL			= $2005
PPU_ADDR			= $2006
PPU_DATA			= $2007
OAM_DMA				= $4014

SOUND_CH1_1			= $4000		; Duty(2)|時間カウンタ|音響変化|ボリューム(4)
SOUND_CH1_2			= $4001		; 周波数変化|変化速度(3)|変化方向|変化範囲(3)
SOUND_CH1_3			= $4002		; 周波数下位
SOUND_CH1_4			= $4003		; 再生時間(5)|周波数上位(3)
SOUND_CH2_1			= $4004
SOUND_CH2_2			= $4005
SOUND_CH2_3			= $4006
SOUND_CH2_4			= $4007
PPU_DMA				= $4014
SOUND_CHANNEL		= $4015		; 未使用(3)|DPCM|ノイズ|三角波|CH2|CH1
