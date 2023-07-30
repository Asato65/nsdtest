; ZeroPage
tmp1				= $f0
tmp2				= $f1
tmp3				= $f3
scroll_x			= $f4
scroll_y			= $f5
ppu_ctrl_cpy		= $f6				; |NMI-ON|PPU=MASTER|SPR8*8|BG$1000|SPR$0000|VRAM+1|SCREEN$2000|
ppu_mask_cpy		= $f7				; |R|G|B|DISP-SPR|DISP-BG|SHOW-L8-SPR|SHOW-L8-BG|MODE=COLOR|

nmi_cnt				= $fd
frm_cnt				= $fe
isend_main			= $ff

