DBS=$(mysql -Nse "show databases" | sed "/.*_schema$/d" | sed "/sys/d")
for db in $DBS ; do
  #uncomment to sync master and slave
  #echo "$(date) - Syncing  $db ..." >> ~/dbsync.log
  #echo "$(date) - Syncing  $db ..."
  #pt-table-sync --execute --no-check-slave -d $db $(cat /home/cpadmin/mstsync.cf) $(cat /home/cpadmin/slsync.cf) >> ~/dbsync.log 2>&1

  echo "$(date) - Checking  $db ..."
  echo "$(date) - Checking  $db ..." >> ~/dbsync.log
  pt-table-sync --print --no-check-slave -d $db $(cat /home/cpadmin/mstsync.cf) $(cat /home/cpadmin/slsync.cf) >> dbsync.log 2>&1
done
