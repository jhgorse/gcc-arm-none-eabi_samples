# Utilities 
include ../Makefile.conf

vpath %.c STM32_EVAL STM32_EVAL/STM3210C_EVAL

#CFLAGS += -ffreestanding -nostdlib
#CFLAGS += -I./ -ICMSIS/Core/CM3 -ISTM32_ETH_Driver/inc -ISTM32F10x_StdPeriph_Driver/inc
CFLAGS += -ISTM32_EVAL -ISTM32_EVAL/STM3210C_EVAL
CFLAGS += -I$(PI) -I$(SPL) -I$(P_CMSIS)

SRCS = stm32_eval.c stm3210c_eval_ioe.c stm3210c_eval_lcd.c

OBJS = $(SRCS:.c=.o)

.PHONY: efsl lwip STM32_EVAL
all: efsl lwip STM32_EVAL

efsl:
	make -C efsl

#libstm32f10x.a-> lib$(NAME)-$(CORE).a

lwip:
	make -C lwip-1.3.1

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $^

STM32_EVAL: $(OBJS)

clean:
	rm -f $(OBJS)
	make -C efsl clean
	make -C lwip-1.3.1 clean


