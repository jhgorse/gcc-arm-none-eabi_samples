#!/bin/tcsh

# This is the SRCS output
cat raw.rapp | \
sed -e 's/\t\t<Node.* Path="/SRCS += /' | sed -e 's/".*/ /' | \
grep -v Header | grep -v Group | sed -e 's/\\/\//g' >! tmp.txt

cat tmp.txt | head -n 1 | sed -e 's/\+\=/ \=/' >! src.txt
tail -n+2 tmp.txt >> src.txt

# This is the unique directories of sources for vpathes
cat raw.rapp | sed -e 's/\t\t<Node.* Path="//' | sed -e 's/".*/ /' | \
grep -v "<" | sed -e 's/\\/\//g' | sed -e 's:/[^/]*$: \\:' | awk 'NF' | uniq >! vps

#| perl -ne 'chomp and print'
