include ../../Makefile.conf

NAME = lwip-1.3.1

BASE = ../$(BASE)

vpath %.c src/api src/core src/core/ipv4 src/core/ipv6 src/core/snmp \
 src/netif src/netif/ppp \
 port port/arch

#CFLAGS += -ffreestanding -nostdlib
CFLAGS += -Isrc/include -Isrc/include/ipv4 -Isrc/include/netif -Isrc/include/netif/ppp \
-Iport -Iport/arch -Iport/arch/junk -I$(PI)
#CFLAGS += -I$(PI)

# src/core:
SRCS = dhcp.c dns.c init.c mem.c memp.c netif.c pbuf.c raw.c \
stats.c sys.c tcp.c tcp_in.c tcp_out.c udp.c

# src/core/ipv4:
SRCS += autoip.c icmp.c igmp.c inet.c inet_chksum.c ip.c ip_addr.c ip_frag.c

# src/core/ipv6:
## SRCS += icmp6.c inet6.c ip6.c ip6_addr.c

# src/core/snmp:
SRCS += asn1_dec.c asn1_enc.c mib2.c mib_structs.c msg_in.c msg_out.c

# src/netif:
SRCS +=etharp.c ethernetif.c loopif.c slipif.c

# ppp:
SRCS += auth.c chap.c chpms.c fsm.c ipcp.c lcp.c magic.c md5.c pap.c \
ppp.c ppp_oe.c randm.c vj.c

# src/api:
SRCS += api_lib.c api_msg.c err.c netbuf.c netdb.c netifapi.c sockets.c tcpip.c

OBJS = $(SRCS:.c=.o)

.PHONY: lib$(NAME)-$(CORE).a
all: lib$(NAME)-$(CORE).a

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $^

lib$(NAME)-$(CORE).a: $(OBJS)
	$(AR) -r ../$@ $(OBJS)

clean:
	rm -f $(OBJS) lib*.a
