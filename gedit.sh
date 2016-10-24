#!/bin/bash

echo O.S : `uname`
echo user: $USER
while true ; do


echo -n "-----Menu-----
1) Execute a command.
2) Find Files.
3) Show usage.
4) Show files of the running catalog with their full path.
5) Show the files which have been modified.

Give an option:"
read option
clear

case $option in

1) echo Give a command:
	read a
	find . | xargs $a
	
	
   until [ $? -eq 0 ]
  	 do $a 

   if [ $? -ne 0 ]
    then
     	 echo Give an another command.
     	 read a
     	 echo $a
    	  $a
   fi
done
;;

2) echo Define the minimum size of files you want to find in MB:
	read a
	echo $((a*1024*1024))
	find . -type f -size -$((a*1024*1024))c
	;;

3) 	STOR=$(du -s -k /$home | awk '{ print $1 }')
	VPN=$(who am i | awk '{ print $6 }')
	echo "$STOR bytes"

	if [ "$VPN" == "(vpn.hua.gr)" ]; then
 	FREE=$((5*1024*1024*1024 - STOR)) 
	echo "$((FREE*100 / 5*1024*1024*1024)) % FREE"
	fi
	;;

4)  	ls -d -1 $PWD/*.* 
	;;

5)  echo "Print the modified files:"
	echo "a)in the last hour"
	echo "b)in the last day(24 hours)"
 
 	read option
 	clear
 
 	if [ "$option" == "a" ]
		then  echo "Print the files which have been modified in the last hour:"
  
  			find . -ctime 0
  		elif [  "$option" == "b" ]
  		   then  echo "Print the files which have been modified in the last day:"
  
  			find . -mtime -1
	fi
	
			
esac
done

