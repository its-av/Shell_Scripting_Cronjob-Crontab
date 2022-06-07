# Shell Scripting


This project involves scheduling a shell script to run periodically every minute. This can be achieved in the Unix/Linux system using the Cron job/Crontab.
I have written a shell script that dynamically creates a text file (one per cron job execution) capturing the current running processes information using “ps -aux command”. The text file contains the contents in sorted fashion of ascending order of memory consumption (column number: 4) with only information of the last 5 processes (5 processes that consume highest memory) per .txt file. I have Scheduled this script to run as a cron job that executes every minute. I have Mentioned the command to schedule the cron job as comments at the top of shell script. 
Further, in every fourth execution of shell script, I have considered the text files of previous three executions and found the process that has consumed the highest amount of total memory in the last three minutes and created a file named - “memory log.txt”. Appended the file with the following single line entry: Current timestamp process name process id total memory consumed in last three minutes. After the fourth execution, I am over-writing the process data into the files already created.

>> Hot to run

extract to /home/av-pc/
>you will get two folder




>>location

# * * * * * /bin/bash /home/av-pc/location/ScriptJob.sh

It contains cronjob that calculates log entry by taking max of memory utilised at 3 instants
#to add job 
>open terminal from this location
>type "bash AddJob.sh"




>>location1

# * * * * * /bin/bash /home/av-pc/location1/Job.sh

It contains cronjob that calculates log entry by taking summation of memory utilised at 3 instants of each process
#to add job 
>open terminal from this location
>type "bash JobAdder.sh"

to remove cronjob
>>type >"crontab -r" 
