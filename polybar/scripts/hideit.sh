#!/usr/bin/env bash

PROCESS_COUNT=$(ps aux | grep -c "hideIt.sh -C")
if [ $PROCESS_COUNT -eq 1 ];
then
  hideIt.sh -C 'polybar' --direction bottom --peek 3 --region 957x1065+100+-100 &
else
  PIDS=`ps aux | grep 'hideIt.sh -C' | awk  '{ print $2 }'`
  for PID in $PIDS
  do
    kill $PID
  done
fi
