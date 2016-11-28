#!/bin/bash
if [ $# = 0 ]
then echo "pas assez d'arguments"
else
echo 0 > inh_left/value
echo 0 > inh_right/value
echo $1 > gpio_sr_left/value
echo $1 > gpio_sr_right/value
echo "C'est parti!!!!"
fi

