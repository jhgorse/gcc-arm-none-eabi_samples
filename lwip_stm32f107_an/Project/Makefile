include ../Makefile.conf

# This shows up in final CFLAGS for cc and link of main.c
STARTUP_DEFS=

vpath %.c src
# .S here and startup_stm32f10x_cl.S later?

#CFLAGS += -ffreestanding -nostdlib
#CFLAGS += -I./ -ICMSIS/Core/CM3 -ISTM32_ETH_Driver/inc -ISTM32F10x_StdPeriph_Driver/inc
CFLAGS += -Iinc
#CFLAGS += -I$(PI)

#SRCS  = stm32f4_discovery.c
SRCS = main.c netconf.c stm32f10x_it.c stm32f107.c

OBJS = $(SRCS:.c=.o)

.PHONY: project
all: project

project: lib util $(NAME)-$(CORE).axf

lib:
	make -C Libraries
	#libstm32f10x.a-> lib$(NAME)-$(CORE).a

util:
	make -C Utilities

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $^

LDSCRIPTS=-L. -L$(BASE)/ldscripts -T gcc.ld
LFLAGS=-L$(BASE)/Libraries -llib$(NAME)-$(CORE).a \
	$(USE_NANO) $(USE_SEMIHOST) $(LDSCRIPTS) $(GC) $(MAP) -g3

$(NAME)-$(CORE).axf: $(SRCS) $(STARTUP)
	$(CC) $^ $(CFLAGS) $(LFLAGS) -o $@
	$(OBJCOPY) -O binary $(NAME)-$(CORE).axf $(NAME)-$(CORE).bin

clean:
	rm -f $(OBJS) $(NAME)*.axf $(NAME)*.bin *.map