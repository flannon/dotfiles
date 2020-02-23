#!/bin/bash

## Full house keeping should includ ethe follwoing
## rm -rf ~/.* (or some approximation that will allwo maidService to finish)
## run the boxen nuke me command  and then rm -rf /opt
## 

TODAY=`/bin/date "+%u"`
#DATE=`/bin/date "+%y%m%d%H%M"`
DATE=`/bin/date`
LOGDIR=${HOME}/log
LOG=${LOGDIR}/maidService.log

getdevs() {
  index=0
  for i in $(df | grep dev | awk ' { print $1 }'); do
    dev=$(echo $i | awk -F "/" '{ print ($1 == 'dev') ? $0 : "" }')
    [[ ! -z $dev ]] && DEVS[index]=$dev && ((index++))
  done
}

[[ ! -d $LOGDIR ]] && mkdir -p $LOGDIR

if [ ! -f $LOG ]; then
    touch $LOG
fi

echo "$DATE - Tidying up the history." >> $LOG
> ~/.bash_history
echo "$DATE - Empting trash." >> $LOG
/bin/rm -rf ${HOME}/.Trash/* 2>&1 1>>$LOG

getdevs

for dev in "${DEVS[@]}"; do
  if [ "$TODAY" -eq "5" ]; then
    #echo "This is Friday run the DoD 35 erase"
    echo "$DATE - Starting weekend cleanup. Cleaning up disk with Gutmann 35-pass secure erase." >> $LOG
    /usr/sbin/diskutil secureErase freespace 3 $dev  2>&1 1>>$LOG
    echo "$DATE - Finished weekly cleanup." >> $LOG

  else
    #echo "This is a regular day of the week."
    echo "$DATE - Starting 7-pass daily cleanup." >> $LOG
    /usr/sbin/diskutil secureErase freespace 2 $dev 2>&1 1>>$LOG
    echo "$DATE - Finished daily cleanup." >> $LOG
  fi
done

exit 0
