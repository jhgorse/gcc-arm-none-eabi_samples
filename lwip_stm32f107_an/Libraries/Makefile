include ../Makefile.conf

vpath %.c %.S CMSIS/Core/CM3 STM32_ETH_Driver/src STM32F10x_StdPeriph_Driver/src \
CMSIS/Core/CM3/startup/gcc
# .S here and startup_stm32f10x_cl.S later?

#CFLAGS += -ffreestanding -nostdlib
CFLAGS += -I./ -ICMSIS/Core/CM3 -ISTM32_ETH_Driver/inc -ISTM32F10x_StdPeriph_Driver/inc
CFLAGS += -I$(PI)

#SRCS  = stm32f4_discovery.c
SRCS = misc.c stm32f10x_adc.c stm32f10x_bkp.c stm32f10x_can.c stm32f10x_crc.c \
stm32f10x_dac.c stm32f10x_dbgmcu.c stm32f10x_dma.c stm32f10x_exti.c \
stm32f10x_flash.c stm32f10x_fsmc.c stm32f10x_gpio.c stm32f10x_i2c.c \
stm32f10x_iwdg.c stm32f10x_pwr.c stm32f10x_rcc.c stm32f10x_rtc.c \
stm32f10x_sdio.c stm32f10x_spi.c stm32f10x_tim.c stm32f10x_usart.c stm32f10x_wwdg.c
SRCS += core_cm3.c system_stm32f10x.c
#startup_stm32f10x_cl.S

OBJS = $(SRCS:.c=.o)
#OBJS += startup_stm32f10x_cl.o

.PHONY: lib$(NAME)-$(CORE).a
all: lib$(NAME)-$(CORE).a

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $^

%.o : %.S
	$(CC) $(CFLAGS) -c -o $@ $^

lib$(NAME)-$(CORE).a: $(OBJS)
	$(AR) -r $@ $(OBJS)

clean:
	rm -f $(OBJS) lib*.a
