#run as: check_log.sh google (to filter google pages)
CHECKCOUNT=$(awk -v d1="$(date --date="-1 min" "+%b %e %H:%M:%S")" -v d2="$(date "+%b %e %H:%M:%S")" '$0 > d1 && $0 < d2 || $0 ~ d2' /var/log/pihole/pihole.log | grep -ci $1)
echo $CHECKCOUNT
if [ $CHECKCOUNT -gt 0 ]
then
        $(/bin/python3 ./send_telegram.py)
else
   echo "Do nothing" > /dev/null
fi
