printf "\x1bc\x1b[43;37m"
roots=$(pwd)/roots
tmps=/tmp/lists.txt
tmps2=/tmp/lists2.txt
fbc interpreter.bas
mkdir -p $roots
mkdir -p $roots/usr
mkdir -p $roots/usr/bin
mkdir -p $roots/bin
mkdir -p $roots/tmp
mkdir -p $roots/lib
mkdir -p $roots/dev
mkdir -p $roots/boot
mkdir -p $roots/lib/i386-linux-gnu
cp /lib/ld-linux.so.* $roots/lib
cp /lib/i386-linux-gnu/libm.so.* $roots/lib
cp /lib/i386-linux-gnu/linux-gate.so.* $roots/lib/i386-linux-gnu
cp /lib/linux-gate.so.* $roots/lib
cp  ./interpreter $roots/usr/bin
cp  ./interpreter $roots/bin
cp  /usr/bin/bash $roots/usr/bin
cp  /usr/bin/bash $roots/bin
cp  /usr/bin/sh $roots/usr/bin
cp  /usr/bin/sh $roots/bin
cp  /usr/bin/ls $roots/usr/bin
cp  /usr/bin/ls $roots/bin
cp  ./run.shell $roots/usr/bin
cp  ./run.shell $roots/bin


printf "" > $roots/dev/null
printf "" > $roots/dev/stdio
printf "" > $roots/dev/stdout
printf "" > $roots/dev/stdin
chmod 777 $roots/bin/*
chmod 777 $roots/usr/bin/*
printf "" > $tmps
list1=$(ls $roots/usr/bin/*)
for l1 in $list1
do
ldd "$l1" | grep  '/lib/' >> $tmps
done
awk '{for(i=1;i<=NF;i++) if($i ~ /\/lib\//) print $i}' $tmps > $tmps2
while IFS= read -r l1
do

rt="$roots$l1"
printf "$rt\n"
cp "$l1" "$rt" 
done < "$tmps2"




