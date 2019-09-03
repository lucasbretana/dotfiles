#!/usr/sh

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

##########
# config
###
LOGFILE=~/.xsession-errors;
##########

# log stuff
_log ()
{
  _dt=$(date "+%m.%d %H:%M.%S");
  echo "[${_dt}] (xinitrc) ..> $*" >> "$LOGFILE";
}

_log "starting..";
#############################
# deamons and background jobs
_log "deamons n' background jobs";
#####
# set up session stuff
[ -f ~/.xsessionrc ] && sh ~/.xsessionrc;

# dbus for communication
#/usr/bin/dbus-launch &

# start a XTerm
/usr/bin/X11/x-terminal-emulator &
#############################

# important variables for xinitrc
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
  _log "(WW) needed to set the DBUS_SESSION_BUS_ADDRESS variable";
  export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus;
fi
if [ -z "$XAUTHORITY" ]; then
  _log "(WW) needed to set the XAUTHORITY variable";
  export XAUTHORITY=/home/$USER/.Xauthority;
fi
if [ -z "$DISPLAY" ]; then
  _log "(WW) needed to set the DISPLAY variable";
  export DISPLAY=:0;
fi

_log "starting x-window-manager..";
# run window manager or a display manager
exec x-window-manager;

_log "..finishing";
