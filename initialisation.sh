#!/bin/bash

#création des dossiers associés aux gpio utilisés
echo 60 > /sys/class/gpio/export
echo 20 > /sys/class/gpio/export
echo 48 > /sys/class/gpio/export
echo 49 > /sys/class/gpio/export

#gpio correspondants au sens de rotation défini comme sorties
echo "out" > /sys/class/gpio/gpio60/direction
echo "out" > /sys/class/gpio/gpio48/direction
echo "out" > /sys/class/gpio/gpio49/direction
echo "out" > /sys/class/gpio/gpio20/direction

echo 1 > /sys/class/gpio/gpio60/active_low #moteur dans l'autre sens donc logique neg
echo 0 > /sys/class/gpio/gpio48/active_low
echo 1 > /sys/class/gpio/gpio49/active_low #logique neg pour tourner à inhib=0
echo 1 > /sys/class/gpio/gpio20/active_low
echo 0 > /sys/class/gpio/gpio60/value #c'est celui en logique neg
echo 0 > /sys/class/gpio/gpio48/value
echo 1 > /sys/class/gpio/gpio20/value #départ arrêté
echo 1 > /sys/class/gpio/gpio49/value


rm gpio_sr_*t
rm inh_*t
ln -s /sys/class/gpio/gpio60 gpio_sr_left 
ln -s /sys/class/gpio/gpio48 gpio_sr_right
ln -s /sys/class/gpio/gpio49 inh_right
ln -s /sys/class/gpio/gpio20 inh_left


#gestion PWM
echo am33xx_pwm > /sys/devices/bone_capemgr.*/slots
echo bone_pwm_P9_14 > /sys/devices/bone_capemgr.*/slots
echo bone_pwm_P9_16 > /sys/devices/bone_capemgr.*/slots

#définition de la période et du rapport cyclique
alpha=0.1
period=500000
#echo 50000 > /sys/devices/ocp.*/pwm_test_P9_14.*/period
echo 100000 > /sys/devices/ocp.*/pwm_test_P9_14.*/duty
#echo 50000 > /sys/devices/ocp.*/pwm_test_P9_16.*/period
echo 100000 > /sys/devices/ocp.*/pwm_test_P9_16.*/duty


rm pwm_left
rm pwm_right
ln -s /sys/devices/ocp.*/pwm_test_P9_14.* pwm_left
ln -s /sys/devices/ocp.*/pwm_test_P9_16.* pwm_right

