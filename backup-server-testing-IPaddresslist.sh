#!/usr/bin/env bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

hosts=( LEMONADE )



rm /home/intuitive/Downloads/nodes2.txt
cat /home/intuitive/Downloads/nodes1.txt | uniq -u > /home/intuitive/Downloads/nodes2.txt






for i in "${hosts[@]}"
do
  :
  if [ ! -d "$DESTINATION/$i" ]; then
    mkdir $DESTINATION/$i 
  fi
  rsync --noatime --update -avh $ssh_user@$i:$SOURCE $DESTINATION/$i/
  find $DESTINATION/$i -mindepth 1 -mtime +$days_to_keep -delete
done
