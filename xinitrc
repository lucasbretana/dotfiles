#!/usr/bin/sh

# startx will start X: invoking xinit
# xinit will run ~/.xinitrc as a shell script
# ~/.xinitrc will:
#   set up a suitable X environment,
#   launch other programs, a.k.a "clients" that we may want available as soon as X is started
#
# the X Window Manager (Xorg for Debian) is typically the last application started
# X includes xdm (X Display Manager) for "GUI log-in" approach, where X is running before log-in (more common)
#
# This file is sourced when running startx and
#    other programs which call xinit like the Display Manager
#
# As in all Bash/sh scripts lines starting with

#    '#' are comments
# turn off system bell if on display
if [ -n "$DISPLAY" ]; then
  xset b off;
fi

# important variables for xinitrc
[ -z "$DBUS_SESSION_BUS_ADDRESS" ] || export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus;
[ -z "$XAUTHORITY" ] || export XAUTHORITY=/home/lebretana/.Xauthority;
[ -z "$DISPLAY" ] || export DISPLAY=:1;

# loads up configuration for X resources
[ -f ~/.Xresources ] && xrdb -load ~/.Xresources;

hn=$(eval cat /etc/hostname);
wp=$HOME/Pictures/Wallpapers;
if [ "$hn" = "lups03" ]; then
  # monitor resolusion
  xrandr --output DVI-I-0 --mode 1920x1080 --primary --right-of HDMI-0 ; # dell
  xrandr --output HDMI-0 --mode 1280x720 --left-of DVI-I-0 ;             # lg
elif [ "$hn" = "lups08" ]; then
  # monitor resolusion
  xrandr --output DVI-I-2 --mode 1920x1080 --primary --left-of DVI-I-1 ; # dell
  xrandr --output DVI-I-1 --mode 1280x1024 --right-of DVI-I-2 ;          # samsung
#elif [ "$hn" = "MORDOR" ]; then
fi

# set background to your favorite pic
wp=$HOME/Pictures/Wallpapers
feh --bg-scale "$wp"/gandalf-minimalist.jpg --bg-scale "$wp"/the-ring-minimalist.jpg;
#xsetbg -fullscreen "$wp"/gandalf-minimalist.jpg;

# start a XTerm
/usr/bin/X11/x-terminal-emulator &

# run a display manager
exec x-window-manager;
