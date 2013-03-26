# earned income credits, head of household

include ../Makefile.conf

NAME = stm32f107_lwip

# This shows up in final CFLAGS for cc and link of main.c
STARTUP_DEFS=

vpath %.c src 
vpath %.a ../Libraries ../Utilities
vpath %.o ../Utilities

# .S here and startup_stm32f10x_cl.S later?

#CFLAGS += -ffreestanding -nostdlib
#CFLAGS += -I./ 
#-ICMSIS/Core/CM3 -ISTM32_ETH_Driver/inc -ISTM32F10x_StdPeriph_Driver/inc
CFLAGS += -Iinc -I../Libraries/STM32_ETH_Driver/inc 
CFLAGS += -I$(SPL) -I$(CMSIS) 
CFLAGS += -I../Utilities/STM32_EVAL -I../Utilities/STM32_EVAL/STM3210C_EVAL 
CFLAGS += -I../Utilities/lwip-1.3.1/src/include ../Utilities/lwip-1.3.1/port 


#SRCS  = stm32f4_discovery.c
SRCS = main.c netconf.c stm32f10x_it.c stm32f107.c

OBJS = $(SRCS:.c=.o)

.PHONY: lib util liblwIP-CM3.a libefsl-CM3.a liblwip-1.3.1-CM3.a libefsl-CM3.a liblwip-1.3.1-CM3.a
all: lib util $(NAME)-$(CORE).axf

#project: lib util $(NAME)-$(CORE).axf

lib: liblwIP-CM3.a
	make -C ../Libraries
	#libstm32f10x.a-> lib$(NAME)-$(CORE).a

util: libefsl-CM3.a liblwip-1.3.1-CM3.a
	make -C ../Utilities

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $^
%.o : %.S
	$(CC) $(CFLAGS) -c -o $@ $^

LDSCRIPTS=-L. -L$(BASE)/ldscripts -T gcc.ld
LFLAGS=-L$(BASE)/Libraries -lliblwIP-CM3.a \
-L$(BASE)/Utilities -llibefsl-CM3 -lliblwip-1.3.1-CM3 \
	$(USE_NANO) $(USE_SEMIHOST) $(LDSCRIPTS) $(GC) $(MAP) -g3

$(NAME)-$(CORE).axf: $(SRCS) $(STARTUP)
	$(CC) $^ $(CFLAGS) $(LFLAGS) -o $@
	$(OBJCOPY) -O binary $(NAME)-$(CORE).axf $(NAME)-$(CORE).bin

clean:
	rm -f $(OBJS) $(NAME)*.axf $(NAME)*.bin *.map