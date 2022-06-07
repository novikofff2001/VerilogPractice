CROSS_COMPILE ?= /opt/riscv-pulp/bin/riscv32-unknown-elf-

CC      =   $(CROSS_COMPILE)gcc
LD      =   $(CROSS_COMPILE)ld
OBJDUMP =   $(CROSS_COMPILE)objdump
OBJCOPY =   $(CROSS_COMPILE)objcopy
SIZE    =   $(CROSS_COMPILE)size

# Добавить в список строки ниже ваши артефакты сборки
OBJS =  $(addprefix src/, int.o startup/crt0.riscv.o exceptions.o lib.o main.o)
LDS_EMB     = src/startup/link.common.ld
OUTPUT      = pulpino
OUTPUT_EMB  = $(OUTPUT)

INC_DIR   = inc
CC_FLAGS = -O0 -nostartfiles
LD_FLAGS = -T $(LDS_EMB) -Wl,--gc-sections

.PHONY: all dat embedded clean
all: clean embedded dat

embedded: $(OUTPUT_EMB)

$(OUTPUT_EMB): $(LDS_EMB) $(OBJS)
# Поправить строку ниже (здесь происходит итоговая сборка программы, но чего-то
# не хватает)
	${CC} -o $(OUTPUT_EMB).elf $(CC_FLAGS) $(LD_FLAGS) $(OBJS)
	${OBJCOPY} -O binary $(OUTPUT_EMB).elf $(OUTPUT_EMB).bin
	${OBJDUMP} -D $(OUTPUT_EMB).elf > disasm_emb.S
	$(SIZE) $(OUTPUT_EMB).elf

dat: embedded
	python3 generate_dat.py $(OUTPUT_EMB).bin $(OUTPUT_EMB).dat
	./elf2dat.sh $(OUTPUT_EMB).elf

clean:
	rm -f $(OBJS) $(addprefix $(OUTPUT_EMB), .elf .bin .dat)
	rm -f disasm.S disasm_debug.S disasm_emb.S disasm_boot.S

%.o:	%.S
	${CC} -I$(INC_DIR) -c $^ -o $@

%.o:	%.c
	${CC} -I$(INC_DIR) -c $^ -o $@

