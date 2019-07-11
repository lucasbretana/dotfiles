#!/usr/bin/env bash

##############################################################
# @author Lucas E. Bretana
#
# Sets all the bash files
#
##############################################################

# link files to corresponding destination
# see the env files to define the destination
# params: files that should be installed
install ()
{
  if [ -f env ]; then
    source ./env;
  else
    echoerr "Missing env file";
    exit $ERR_ENV_MISS;
  fi;

  echo "Files and its location";
  for i in $@; do
    local _fname=$(basename $i);
    local _floc=${FILELOC[$_fname]};
    if [ -z "$_floc" ]; then
      echoerr "File \"$_fname\" doesn't have a proper destination";
      exit $ERR_ENV;
    fi
    echo "-> $_fname" linked to $_floc;
  done
  echo;echo;

  echo "All right? (y/n)";
  read -n 1 ANS;
  case "$ANS" in
    [yY]*)
      for i in $@; do
        local _fname=$(basename $i);
        local _floc=${FILELOC[$_fname]};
        mkdir -p $(dirname ${FILELOC[$_fname]});
        ln -si "$(pwd -P)"/"$i" "$_floc";
        echo "-> $i" linked to $_floc;
      done
      ;;
    [nN]*)
      echo -e "\nSo, set it on file \"env\" and re-run";
      exit $OK;;
    *)
      echoerr "Invalid option, killing it";
      exit $ERR_INV_OPT;;
  esac
}

# check for files to be installed, or list them
# params: list of files to be installed or nothing
check ()
{
  FILES="$@";
  if [ -z "$FILES" ];then
    echo "You did not specify the files";
    echo "So, should I install all those in this folder and res/*? (y/n)";
    echo "ps: note that I will not do this recursively";
    read -n 1 ANS
    echo " ";

    case "$ANS" in
      [yY]*)
        FILES=`ls -I install.sh -I README.md -I env -I res`;
        FILES+=" ";
        FILES+=`ls res/`;;
      [nN]*)
        echo -e "\nWell, aborting then";
        exit $OK;;
      *)
        echoerr "Invalid option, killing it";
        exit $ERR_INV_OPT;;
    esac
  fi
}

main ()
{
  case "$1" in
    "help")
      help;;
    "--side-by-side")
      echoerr "Not implemented yet";
      exit $ERR_UNKOWN;;
    *)
      check "$@";
      if [ $? -eq 0 ];then
        install "$FILES";
      else
        return $?;
      fi
  esac
}

help ()
{
  echo -e "\nUsing \"$0 [OPTIONS]\"";
  echo -e "\n--side-by-side: try to keep the old file (if any) and add this as secondary setup";
  echo -e "\nhelp: show this message and exit";
  echo;echo;
  echo -e "Exit codes";
  echo -e "OK $OK";
  echo -e "ERR_UNKOWN $ERR_UNKOWN";
  echo -e "ERR_ENV $ERR_ENV";
  echo -e "ERR_ENV_MISS $ERR_ENV_MISS";
  echo -e "ERR_INV_OPT $ERR_INV_OPT";
}

echoerr ()
{
  RED='\033[1;31m';
  NC='\033[0m';
  echo -e "$RED${@:-error}$NC" 1>&2
}


OK=0;
ERR_UNKOWN=1;
ERR_ENV=2;
ERR_ENV_MISS=3;
ERR_INV_OPT=4;

main $@;
exit $?;
