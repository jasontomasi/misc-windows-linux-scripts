#!/usr/bin/env bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

hosts=( LEMONADE )

DESTINATION=/var/backups
backup_name=`date "+%Y-%m-%d-%H%M%S"`
SOURCE="/cygdrive/V/BACKUP/"
ssh_user=intuitive
days_to_keep=180

for i in "${hosts[@]}"
do
  :
  if [ ! -d "$DESTINATION/$i" ]; then
    mkdir $DESTINATION/$i 
  fi
  rsync --noatime --update -avh $ssh_user@$i:$SOURCE $DESTINATION/$i/
  find $DESTINATION/$i -mindepth 1 -mtime +$days_to_keep -delete
done


rsync --noatime --update -avh -e "ssh -i /var/backups/.ssh/id_rsa" intuitive@192.168.137.1:/BACKUP/ /var/backups/LEMONADE/