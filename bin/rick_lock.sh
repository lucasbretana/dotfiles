#!/usr/bin/env bash

# Config
img=~/Pictures/res/rick_lock.png
# EndConfig

revert() {
  rm /tmp/*screen*.png
  xset dpms 0 0 0
  echo "a";
}
trap revert HUP INT TERM
xset +dpms dpms 0 0 5
scrot -d 1 /tmp/locking_screen.png
convert -blur 0x8 /tmp/locking_screen.png /tmp/screen_blur.png
convert -composite /tmp/screen_blur.png $img -gravity South -geometry -20x1200 /tmp/screen.png
i3lock -i /tmp/screen.png
revert
