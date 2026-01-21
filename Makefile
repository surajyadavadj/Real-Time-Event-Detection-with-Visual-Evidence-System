CC      = arm-none-eabi-gcc
OBJCOPY = arm-none-eabi-objcopy

MCU     = -mcpu=cortex-m4 -mthumb
DEFS    = -DSTM32F411xE

CFLAGS  = $(MCU) -O0 -g -Wall -ffreestanding $(DEFS) -u _printf_float
LDFLAGS = -T linker.ld -nostdlib -lc -lgcc -lnosys

INCLUDES = \
 -Icmsis/Include \
 -Icmsis/STM32F4xx/Include
SRC = main.c uart.c i2c.c oled.c w5500_spi.c spi.c w5500.c adxl345.c gps.c delay.c system_stm32f4xx.c startup.s syscalls.c
OBJ = main.o uart.o i2c.o oled.o w5500_spi.o spi.o w5500.o adxl345.o gps.o delay.o system_stm32f4xx.o startup.o syscalls.o


TARGET = firmware.elf
BIN    = firmware.bin

all: $(TARGET) $(BIN)

%.o: %.c
		$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

%.o: %.s
		$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(LDFLAGS) -o $@

$(BIN): $(TARGET)
		$(OBJCOPY) -O binary $< $@

flash:
	openocd -f board/st_nucleo_f4.cfg \
	        -c "program $(TARGET) verify reset exit"

clean:
	rm -f *.o *.elf *.bin

serialmonitor:
	minicom -b 115200 -D /dev/ttyACM0

.PHONY: all clean flash

