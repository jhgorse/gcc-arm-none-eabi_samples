include ../../Makefile.conf

vpath %.c source source/interface
# .S here and startup_stm32f10x_cl.S later?

#CFLAGS += -ffreestanding -nostdlib
CFLAGS += -Isource -Isource/interface
#CFLAGS += -I$(PI)

#SRCS  = stm32f4_discovery.c
SRCS = dir.c disc.c efs.c extract.c fat.c file.c fs.c \
sd_stm32.c sd.c ioman.c ls.c mkfs.c partition.c \
plibc.c time.c ui.c

OBJS = $(SRCS:.c=.o)

.PHONY: $(SRCS)
	$(OBJS)
all: $(SRCS)
	$(OBJS)

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $^

clean:
	rm -f $(OBJS)
