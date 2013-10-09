
# makefile

# This file assumes you are using a USBTinyISP to program a ATMega328 (NOT the ATMega328P pico-power model)
#   with the referenced C code.

# Program Variables
PROGRAM = torch
SRC = ${PROGRAM}.c
OBJ = ${PROGRAM}.o
ELF = ${PROGRAM}.elf
HEX = ${PROGRAM}.hex

# Programmer Variables
PROGRAMMER = usbtiny
PORT = usb

# Part Variables
MCU_TARGET = atmega328
AVRDUDE_TARGET = m328
DF_CPU = 9600000

# Compiler Variables
OPTIMIZE = -Os
DEFS =
LIBS =
# Override is only needed by avr-lib build system.
override CFLAGS = -g -Wall $(OPTIMIZE) -mmcu=$(MCU_TARGET) $(DEFS)
override LDFLAGS = -Wl,-Map,$(PRG).map

# Binarys
CC = avr-gcc
SIZE = avr-size
OBJCOPY = avr-objcopy
DUDE = avrdude
SUDO = sudo

# Make Targets

all: ${HEX}

help:
	@echo " "
	@echo "Make targets for \"${PROGRAM}\": "
	@echo "  all		build binary"
	@echo "  install	install binary"
	@echo "  clean		clean build files"
	@echo " "

${HEX}: ${ELF}
	${OBJCOPY} -j .text -j .data -O ihex ${ELF} ${HEX}

${ELF}: ${OBJ}
	${CC} -g -DF_CPU=${DF_CPU} -Wall -Os -mmcu=${MCU_TARGET} -o ${ELF} ${OBJ}
	${SIZE} ${ELF}

${OBJ}: ${SRC}
	${CC} -g -DF_CPU=${DF_CPU} -Wall -Os -mmcu=${MCU_TARGET} -c -o ${OBJ} ${SRC}

clean:
	rm -f ${OBJ} ${ELF} ${HEX}

install: ${HEX}
	${SUDO} ${DUDE} -c ${PROGRAMMER} -P ${PORT} -p ${AVRDUDE_TARGET} -U flash:w:${HEX}

