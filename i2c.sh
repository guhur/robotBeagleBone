
while true; do
i2cset -y 1 0x70 0x00 0x51
rlb=$(i2cget -y 1 0x70 0x03)
rhb=$(i2cget -y 1 0x70 0x02)
tot="${rhb:2:4}${rlb:2:4}"
num=$(echo "ibase=16; ${tot^^}"|bc)
echo -ne " \r $num" 
sleep .1
done