MAIN_FILE = music
ASM_FILE = $(MAIN_FILE).asm
OBJ_FILE = $(MAIN_FILE).o
NES_FILE = $(MAIN_FILE).nes
DBG_FILE = $(MAIN_FILE).dbg
CFG_FILE = .vscode/memmap.cfg

MUSIC_FILE = smb
MUSIC_MML_FILE = $(MUSIC_FILE).mml
MUSIC_ASM_FILE = $(MUSIC_FILE).s
MUSIC_OBJ_FILE = $(MUSIC_FILE).o

ASSEMBLER = ca65.exe
LINKER = ld65.exe
MUSIC_COMPILER = nsd/bin/nsc.exe

EMULATOR = Mesen.exe

all : clean build play

clean :
	-rm $(OBJ_FILE) $(DBG_FILE)
	-del $(OBJ_FILE) $(DBG_FILE)

build : $(NES_FILE) $(OBJ_FILE) $(MUSIC_OBJ_FILE) $(MUSIC_ASM_FILE)

play : $(NES_FILE)
	$(EMULATOR) $(NES_FILE)

$(MUSIC_ASM_FILE) : $(MUSIC_MML_FILE)
	$(MUSIC_COMPILER) -a $(MUSIC_MML_FILE)

$(MUSIC_OBJ_FILE) : $(MUSIC_ASM_FILE)
	$(ASSEMBLER) $(MUSIC_ASM_FILE)

$(OBJ_FILE) : $(ASM_FILE)
	ca65 $(ASM_FILE) -t none -g -I ./asm -I ./inc -I ./nsd/include

$(NES_FILE) : $(OBJ_FILE) $(MUSIC_OBJ_FILE)
	ld65 --dbgfile $(DBG_FILE) -L nsd/lib -C $(CFG_FILE) -vm -o $(NES_FILE) $(OBJ_FILE) $(MUSIC_OBJ_FILE) nsd/lib/nsd.lib


# ca65 -t none -I..\..\include\\ -g testmus.s
# ld65 -C nesa.cfg -L..\..\lib\\ -vm --dbgfile test.dbg -o test.nes ines.o crt0.o work.o nmi_main.o irq_main.o main.o testmus.o ..\..\lib\\nsd.lib