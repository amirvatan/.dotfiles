#!/bin/zsh 

#todo >> output.txt 
for NAME in $(~/todo)
do 
	notify-send "$NAME!" -t 10000
done
