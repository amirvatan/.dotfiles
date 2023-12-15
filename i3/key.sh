#!/bin/bash
NUM=$(setxkbmap -query | grep -c us)

if [[ $NUM -eq 1 ]]
then
  setxkbmap ir
else
  setxkbmap us
fi
