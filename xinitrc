#!/usr/bin/env bash

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

# loads up configuration for X resources
[ -f ~/.Xresources ] && xrdb -load ~/.Xresources

# set background to your favorite pic
wp=$HOME/Pictures/Wallpapers
xsetbg -fullscreen "$wp"/gandalf-minimalist.jpg
#xsetbg -fullscreen ~/Pictures/Wallpapers/gandalf-minimalist.jpg

# start a XTerm
/usr/bin/X11/x-terminal-emulator &

# run a display manager
exec x-window-manager
