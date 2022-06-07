crontab -l > mycron
echo "* * * * * /bin/bash /home/av-pc/location/ScriptJob.sh" >> mycron
crontab mycron
rm mycron
