#!/bin/sh
#* * * * * /bin/bash /home/av-pc/location/ScriptJob.sh
location=""
read index < /home/av-pc/location/temp/counter #read current counter
co=$(printf "%02d" $((( index+1)%4 )) > /home/av-pc/location/temp/counter)
zero=0
#echo "$((( index+1)%4 ))" > /home/av-pc/Downloads/teeat.txt
#echo printf "%02d" $((( index+1)%4 )) > /home/av-pc/Downloads/counter >> /home/av-pc/Downloads/teet.txt
#FILE1=/home/av-pc/location/files/1.txt
#FILE2=/home/av-pc/location/files/2.txt
#FILE3=/home/av-pc/location/files/3.txt
#test=/home/av-pc/location/files
star="File"
fn=$((( index+1)%4 ))
fnn=$star$fn
ext=".txt"
fnam=$fnn$ext
location=/home/av-pc/location/files/$fnam #create File.txt
#ps aux --sort +rss | tail -5 > $location
if test $((( index+1)%4 )) -gt $zero ; 
	then ps aux --sort +rss | tail -5 > $location
else
	#echo "Hello" >> /home/av-pc/Downloads/log1
	#lrow1=$(echo $(tail -n 1 /home/av-pc/Downloads/work1/1)|cut -d " " -f4)
	#lrow2=$(echo $(tail -n 1 /home/av-pc/Downloads/work1/2)|cut -d " " -f4)
	#lrow3=$(echo $(tail -n 1 /home/av-pc/Downloads/work1/3)|cut -d " " -f4)
	#echo $(tail -n 1 /home/av-pc/Downloads/work1/1) >> /home/av-pc/Downloads/log 
	#echo $(tail -n 1 /home/av-pc/Downloads/work1/2) >> /home/av-pc/Downloads/log
	#echo $(tail -n 1 /home/av-pc/Downloads/work1/3) >> /home/av-pc/Downloads/log
	#if [[ $lrow1 == $lrow2 && $lrow1 == $lrow3 ]];
	#	then echo $(tail -n 1 /home/av-pc/Downloads/work1/1) >> /home/av-pc/Downloads/memory_log.txt 
	#elif [[ $lrow2 == $lrow1 && $lrow2 == $lrow3 ]];
		#then echo $(tail -n 1 /home/av-pc/Downloads/work1/2) >> /home/av-pc/Downloads/memory_log.txt
	#elif [[ $lrow3 == $lrow1 && $lrow3 == $lrow2 ]];
		#then echo $(tail -n 1 /home/av-pc/Downloads/work1/3) >> /home/av-pc/Downloads/memory_log.txt
	#fi
	cat /home/av-pc/location/files/* > /home/av-pc/location/temp/combined.txt #combine all files.txt
	awk '{a[$2]+=$4}END{for(i in a){print i, a[i]}}' /home/av-pc/location/temp/combined.txt > /home/av-pc/location/temp/sum.txt #summation of all mem based on pid
	sort -k 2 -n /home/av-pc/location/temp/sum.txt > /home/av-pc/location/temp/sorsum.txt #sort based on total memory
	myid=$(echo $(tail -n 1 /home/av-pc/location/temp/sorsum.txt)|cut -d " " -f1) #get id
	memtot=$(echo $(tail -n 1 /home/av-pc/location/temp/sorsum.txt)|cut -d " " -f2) #get total memory
	#echo $myid
	#echo $memtot
	#awk '{if($2 == $myid){print}}' /home/av-pc/Downloads/temp/combined.txt > /home/av-pc/Downloads/temp/fin.txt
	#name=$(echo $(tail -n 1 /home/av-pc/Downloads/temp/sorsum.txt)|cut -d " " -f11)
	cat /home/av-pc/location/temp/combined.txt | while read line ; 
	do temp1=$(echo $line|cut -d " " -f2)
	if [[ $temp1 == $myid ]];
	then 
	name=$(echo $line|cut -d " " -f11) #get name with above id
	echo $(date +"%m-%d-%Y") $(date +"%T") $name $myid $memtot >> /home/av-pc/location/log/memory_log.txt #write log
	break
	fi
	#echo $line; 
	done
fi


