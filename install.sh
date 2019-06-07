#!/usr/bin/env bash

##############################################################
# @author Lucas E. Bretana
#
# Sets all the bash files
#
##############################################################

install ()
{
  if [ -f env ]; then
    source ./env;
  else
    echo "Missing env file";
    exit 10;
  fi;

  echo "Files and its location";
  for i in $@;do
    echo "-> $i" linked to ${FILELOC[$i]};
  done
  echo;echo;
  echo "All right? (y/n)";
  read -n 1 ANS;
  if [ "$ANS" != "y" ]; then
    echo -e "\nSo, set it on file \"env\" and re-run";
    exit 0;
  fi

  for i in $@;do
    ln -si "$(pwd -P)"/"$i" "${FILELOC[$i]}";
    echo "-> $i" linked to ${FILELOC[$i]};
  done
}

check ()
{
  FILES="$@";
  if [ -z "$FILES" ];then
    echo "You did not specify the files";
    echo "So, should I install all those in this folder? (y/n)";
    echo "ps: note that I will not do this recursively";
    read -n 1 ANS
    echo " ";
    if [ "$ANS" = "y" ] || [ "$ANS" = "Y" ];then
      FILES=`ls -I install.sh -I README.md -I env`;
    else
      echo -e "\nWell, aborting"
      return 1;
    fi
  fi
}

main ()
{
  if [ "$1" == "help" ]; then
    help;
  else
    check "$@";
    if [ $? -eq 0 ];then
      install "$FILES";
    else
      return 3;
    fi
  fi
}

help ()
{
  echo -e "\nUsing \"$0 [OPTIONS]\"";
  echo -e "\n--side-by-side: try to keep the old file (if any) and add this as secondary setup";
  echo -e "\nhelp: show this message and exit";
}

main $@;
exit $?;
