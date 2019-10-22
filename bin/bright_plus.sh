#/usr/bin/env bash

n=${1:-1}
bf="/sys/class/backlight/intel_backlight/brightness";
cb=$(cat $bf);
mb=$(cat /sys/class/backlight/intel_backlight/max_brightness);
nb=$(($cb+10*$n));
if [ $nb -ge $mb ]; then
  echo $mb > $bf;
else
  echo $nb > $bf;
fi
