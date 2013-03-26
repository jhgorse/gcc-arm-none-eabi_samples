include ../../Makefile.conf

NAME = efsl

BASE = ../$(BASE)

vpath %.c source source/interface
# .S here and startup_stm32f10x_cl.S later?

#CFLAGS += -ffreestanding -nostdlib
CFLAGS += -Iinclude -Iinclude/interface -I$(PI) -I../../Libraries/STM32F10x_StdPeriph_Driver/inc/
#CFLAGS += -I$(PI)

#SRCS  = stm32f4_discovery.c
SRCS = dir.c disc.c efs.c extract.c fat.c file.c fs.c \
sd_stm32.c sd.c ioman.c ls.c mkfs.c partition.c \
plibc.c time.c ui.c

OBJS = $(SRCS:.c=.o)

.PHONY: lib$(NAME)-$(CORE).a
all: lib$(NAME)-$(CORE).a

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $^

lib$(NAME)-$(CORE).a: $(OBJS)
	$(AR) -r ../$@ $(OBJS)

clean:
	rm -f $(OBJS) ../lib*.a
