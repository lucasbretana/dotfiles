#!/usr/bin/env bash

##############################################################
# @author Lucas E. Bretana
#
# Sets all the bash files
#
##############################################################

# check parameters itself
# call any validation function;
#  then install files
function main ()
{
  export _file_list="";
  for _p in $@; do
    ## flags check
    case "${_p}" in
      "help"|"--help"|"-h")
        help;
        exit ${OK};;
      "--side-by-side"|"-k") ## keep old files if they exist
        echoerr "Not implemented yet";
        exit ${ERR_UNKOWN};;
      *)
        _file_list+=${_p}" ";;
    esac
  done;

  if [ -f env ]; then
    source ./env;
  else
    echoerr "Missing env file";
    exit $ERR_ENV_MISS;
  fi;

  ## validation
  [ 'x'"${_file_list}" != 'x' ] && _check;
  [ 'x'"${_file_list}" == 'x' ] && _list;
  ###

  ## install
  for _f in ${_file_list[@]}; do
    # check for install path in env
    [ 'x'"${FILELOC[$_f]}" == 'x' ] && echoerr "Missing [${_f}] decl in env" && exit ${ERR_INV_OPT};

    if [ -f ${_f} ]; then
      ln -sf $(pwd)/${_f} ${FILELOC[$_f]};
    elif [ -d ${_f} ]; then
      mkdir -p ${FILELOC[$_f]};
      ln -sf $(pwd)/${_f}/* ${FILELOC[$_f]}/;
    fi
  done;

  exit 0;

  ###
}

function _check ()
{
  for _f in ${_file_list}; do
    [ -d ${_f} ] && [ ${_f: -1} == '/' ] && echoerr "Directories should not end with /" && exit ${ERR_INV_OPT};

  done
}

function _list ()
{
  _file_list=$(find home -mindepth 1 -maxdepth 1);
}

function help ()
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
  echo -e "ERR_ABRT $ERR_ABRT";
}


function echoerr ()
{
  RED='\033[1;31m';
  NC='\033[0m';
  echo -e "$RED${@:-error}$NC" >&2;
}

OK=0;
ERR_UNKOWN=1;
ERR_ENV=2;
ERR_ENV_MISS=3;
ERR_INV_OPT=4;
ERR_ABRT=5;

main $@;
exit $?;

# while (true)
# do
#   echo "Install files under \"./bin/\"? (Y/n)";
#   read -n 1 ans;
#   case "${ans}" in
#     [yY]*)
#       install_bin;
#       break;
#       ;;
#     [nN]*)
#       break;
#       ;;
#     *)
#       continue;
#       ;;
#   esac
# done
