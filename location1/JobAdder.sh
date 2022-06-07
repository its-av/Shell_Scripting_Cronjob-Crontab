crontab -l > mycron
echo "* * * * * /bin/bash /home/av-pc/location1/Job.sh" >> mycron
crontab mycron
rm mycron
