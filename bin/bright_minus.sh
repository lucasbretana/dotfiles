#/usr/bin/env bash

bf="/sys/class/backlight/intel_backlight/brightness";
cb=$(cat $bf);
nb=$(($cb-10))
if [ $nb -le 10 ]; then
  echo "10" > $bf;
else
  echo $nb > $bf;
fi
