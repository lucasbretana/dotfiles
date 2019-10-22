#!/bin/bash

# @autor: Bretana
# @date: Thu 16 May 2019 03:08:32 PM -03 
# github: lucasbretana

mx_file=/sys/class/backlight/intel_backlight/max_brightness
bg_fil=/sys/class/backlight/intel_backlight/brightness

value=$(cat $bg_fil);
max=$(cat $mx_file);
if [ $max -eq 0 ]; then
  echo "error";
else
  pc=$((($value*100)/$max));
  echo $pc
fi
