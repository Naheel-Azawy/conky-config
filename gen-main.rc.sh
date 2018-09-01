#!/bin/sh

CPUS=4
FILESYS="root /
home /home/
hdd1 /mnt/hdd1
hdd2 /mnt/hdd2
hdd3 /mnt/hdd3"
NETDEV="wlp3s0"
FONT="Monospace"
SIZE="13.5"
BOLD="\${font $FONT:size=$SIZE:bold}"


cat ./config.rc

echo "
gap_x 1570
gap_y 50
font $FONT:size=$SIZE
update_interval 3.0

TEXT
${BOLD}SYSTEM \${font}\${hr 1}
Hostname: \$alignr\$nodename
Kernel: \$alignr\$kernel
Uptime: \$alignr\$uptime

${BOLD}CPU \${font}\${hr 1}
\${cpugraph 25,330}"
echo "processes: \${alignr}\$processes (\$running_processes running)"
for i in $(seq 1 $CPUS); do
    echo "\${cpubar cpu$i 4,195} \${cpu cpu$i}% \${alignr}\${freq $i}MHz"
done
for i in {1..5}; do
    echo "\${top name $i}\$alignr\${top cpu $i}%"
done

echo "
${BOLD}MEMORY \${font}\${hr 1}
\${memgraph 25,330}
ram \${alignr}\$mem/\$memmax (\$memperc%)
\${membar 4}
swap \${alignr}\$swap/\$swapmax (\$swapperc%)
\${swapbar 4}"
for i in {1..5}; do
    echo "\${top_mem name $i}\$alignr\${top_mem mem $i}%"
done

echo "
${BOLD}FILE SYSTEM \${font}\${hr 1}
\${diskiograph 25,330}"
function echo_fs {
    echo "\${fs_bar 4,90 $2} $1 \${alignr}\${fs_free $2}/\${fs_size $2}"
}
echo "$FILESYS" | while read line; do
    echo_fs $line
done

echo "
${BOLD}NETWORK \${font}\${hr 1}
address: \${addr $NETDEV}
down \$alignr\${downspeed $NETDEV}
\${downspeedgraph $NETDEV 25,330}
up \$alignr\${upspeed $NETDEV}
\${upspeedgraph $NETDEV 25,330}"

