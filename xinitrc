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

_log "getting rid of old logs.." 
if [ -f $LOGFILE ]; then
  mv -f $LOGFILE $LOGFILE.old
fi

_log "done." 

_log "starting..";
#############################
# daemons and background jobs
_log "daemons n' background jobs";
#####
# set up session stuff
[ -f ~/.xsessionrc ] && sh ~/.xsessionrc;

# dbus for communication
### test for an existing busd daemon, just to be safe
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
  # if not found, launch a new one
  eval `dbus-launch --sh-syntax` 2>> $LOGFILE;
  _log "D-Bus per-session daemon address  is: \`$DBUS_SESSION_BUS_ADDRESS\`";
fi

# dropboxd
dropbox start -i 2>> /dev/null &

# start a XTerm
/usr/bin/X11/x-terminal-emulator &
#############################

_log "starting x-window-manager..";
# run window manager or a display manager
exec x-window-manager 2>> $LOGFILE;

_log "..finishing";
