#!/bin/bash
dc_1=0
dc_2=0
f_1=0
f_2=0
inh_1=0
inh_2=0
sr_1=0
sr_2=0

while true
do
sr_1=$(cat gpio_sr_left/value)
sr_2=$(cat gpio_sr_right/value)
inh_1=$(cat inh_left/value)
inh_2=$(cat inh_right/value)
t_1=$(cat pwm_left/period)
t_2=$(cat pwm_right/period)
f_1=$((1000000/$t_1))
f_2=$((1000000/$t_2))
at_1=$(cat pwm_left/duty)
at_2=$(cat pwm_right/duty)
dc_1=$((100*$at_1/$t_1))
dc_2=$((100*$at_2/$t_2))
clear
echo -ne " \t Left Motor \t Right Motor \n
	DC(%) \t $dc_1 \t \t $dc_2 \n
	freq(kHz)$f_1 \t \t $f_2 \n
	inhib \t $inh_1 \t \t $inh_2 \n
	sens \t $sr_1 \t \t $sr_2
	"

sleep 0.1
done
