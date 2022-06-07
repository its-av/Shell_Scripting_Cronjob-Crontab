#!/bin/sh
# * * * * * /bin/bash /home/av-pc/location1/Job.sh
location=""
read index < /home/av-pc/location1/counter #get present counter
co=$(printf "%02d" $((( index+1)%4 )) > /home/av-pc/location1/counter) 
zero=0
#echo "$((( index+1)%4 ))" > /home/av-pc/location1/teeat.txt
#echo printf "%02d" $((( index+1)%4 )) > /home/av-pc/location1/counter >> /home/av-pc/location1/teet.txt
test=/home/av-pc/location1/files
star="File"
fn=$((( index+1)%4 ))
fnn=$star$fn
ext=".txt"
fnam=$fnn$ext
location=/home/av-pc/location1/files/$fnam #create file.txt from above counter
#ps aux --sort +rss | tail -5 > $location
if test $((( index+1)%4 )) -gt $zero ; 
	then ps aux --sort +rss | tail -5 > $location #write file.txt
else
	#echo "Hello" >> /home/av-pc/location1/log1
	lrow1=$(echo $(tail -n 1 /home/av-pc/location1/files/File1.txt)|cut -d " " -f4) #get last row of file1
	lrow2=$(echo $(tail -n 1 /home/av-pc/location1/files/File2.txt)|cut -d " " -f4) #get last row of file2
	lrow3=$(echo $(tail -n 1 /home/av-pc/location1/files/File3.txt)|cut -d " " -f4) #get last row of file3
	#get max by if else and write log file
	if [[ $lrow1 == $lrow2 && $lrow1 == $lrow3 ]];
		then #echo $(tail -n 1 /home/av-pc/location1/files/File1.txt) >> /home/av-pc/location1/memory_log.txt 
		myid=$(echo $(tail -n 1 /home/av-pc/location1/files/File1.txt)|cut -d " " -f2)
		name=$(echo $(tail -n 1 /home/av-pc/location1/files/File1.txt)|cut -d " " -f11)
		memtot=$(echo $(tail -n 1 /home/av-pc/location1/files/File1.txt)|cut -d " " -f4)
		echo $(date +"%m-%d-%Y") $(date +"%T") $name $myid $memtot >> /home/av-pc/location1/memory_log.txt
	elif [[ $lrow2 == $lrow1 && $lrow2 == $lrow3 ]];
		then #echo $(tail -n 1 /home/av-pc/location1/files/File2.txt) >> /home/av-pc/location1/memory_log.txt
		myid=$(echo $(tail -n 1 /home/av-pc/location1/files/File2.txt)|cut -d " " -f2)
		name=$(echo $(tail -n 1 /home/av-pc/location1/files/File2.txt)|cut -d " " -f11)
		memtot=$(echo $(tail -n 1 /home/av-pc/location1/files/File2.txt)|cut -d " " -f4)
		echo $(date +"%m-%d-%Y") $(date +"%T") $name $myid $memtot >> /home/av-pc/location1/memory_log.txt
	elif [[ $lrow3 == $lrow1 && $lrow3 == $lrow2 ]];
		then #echo $(tail -n 1 /home/av-pc/location1/files/File3.txt) >> /home/av-pc/location1/memory_log.txt
		myid=$(echo $(tail -n 1 /home/av-pc/location1/files/File3.txt)|cut -d " " -f2)
		name=$(echo $(tail -n 1 /home/av-pc/location1/files/File3.txt)|cut -d " " -f11)
		memtot=$(echo $(tail -n 1 /home/av-pc/location1/files/File3.txt)|cut -d " " -f4)
		echo $(date +"%m-%d-%Y") $(date +"%T") $name $myid $memtot >> /home/av-pc/location1/memory_log.txt
	fi
fi


