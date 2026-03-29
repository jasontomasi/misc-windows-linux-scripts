#!/usr/bin/env bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

hosts=( LEMONADE )

dir_backup=/var/backups
backup_name=`date "+%Y-%m-%d-%H%M%S"`
paths_to_backup="/cygdrive/V/BACKUP/"
ssh_user=intuitive
days_to_keep=180

for i in "${hosts[@]}"
do
  :
  if [ ! -d "$dir_backup/$i" ]; then
    mkdir $dir_backup/$i 
  fi
  ssh -n $ssh_user@$i 'tar zcf - '"$paths_to_backup"' ' | cat -> $dir_backup/$i/$backup_name.tar.gz
  find $dir_backup/$i -mindepth 1 -mtime +$days_to_keep -delete
done
