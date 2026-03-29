

# 
https://serverfault.com/questions/216125/how-can-i-create-persistent-ssh-connection-to-stream-commands-over-a-period-of
exec 4> >(ssh user@host)
echo 'touch /home/intuitive/testfile.txt' >&4

# Start detached process
https://superuser.com/questions/178587/how-do-i-detach-a-process-from-terminal-entirely
/usr/bin/startx </dev/null &>/dev/null &

# Allow X11 to be started over SSH
edit /etc/X11/Xwrapper.config to include the line:
allowed_users=anybody

# UTIL: Get time in seconds since file was modified
echo $(($(date +%s) - $(date +%s -r orange-1.mp4)))

# UTIL: Remove any commas from end of lines
cat /home/intuitive/filelist.csv | sed 's/[,^t]*$//' > /home/intuitive/filelist.csv

# FUN: takes titles from random man page, using apps in /usr/bin/
man $(ls /usr/bin | shuf -n 1) | sed -n "/^NAME/ { n;p;q }"

# FUN: matrix effect in terminal
echo -e "\e[1;40m" ; clear ; while :; do echo $LINES $COLUMNS $(( $RANDOM % $COLUMNS)) $(( $RANDOM % 72 )) ;sleep 0.05; done|gawk '{ letters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()"; c=$4; letter=substr(letters,c,1);a[$3]=0;for (x in a) {o=a[x];a[x]=a[x]+1; printf "\033[%s;%sH\033[2;32m%s",o,x,letter; printf "\033[%s;%sH\033[1;37m%s\033[0;0H",a[x],x,letter;if (a[x] >= $1) { a[x]=0; } }}'

# FUN: intercom over SSH
rec -t wav - | ssh user@remotehost play -t wav -

# UTIL: prints used\free space on partition on which /home resides
df -hP /home

# UTIl: resize PDF files
ghostscript -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=out.pdf in.pdf

# UTIL: "Is your printer out ouf black and does not support mixing other colors? Use @ImageMagick:"
convert -density 600 input.pdf -fill "#000033" -opaque black output.pdf

# UTIL: Run the given script, exit immediately if another instance is already running (file lock). Convenient for cron tasks.
/usr/bin/flock -n /var/lock/some-lock-name /bin/sh /path/to/script.sh
/usr/bin/flock -n /var/lock/some-lock-name $(which bash) /path/to/script.sh

# Nested shell commands
var="$(command "$(command)")"

# Combine / chain variables into string
ref="hello_$var"

# Specify command processing on array
ls ~/Downloads/{Movies,Music,ISOS,Videos}
echo {apples,oranges,pears,grapes}
echo {1..100}
echo {A..Z}{0..9}

# 
RSYNC=${which rsync}
$RSYNC -az -e 'ssh -p22' root@$BACKUPHOST:/export/home /backup/backprod/incremental 2>> /backup/scripts/scripts.log && \ echo -e "Backup finished succesfully for $BACKHOST ---\n" >> /backup/scripts/scripts.log && \

# error output redirect (to logfile)
netstat -a 2>> /home/intuitive/backup.log

# Check if program exit code is "0"
if [ $? == 0 ]; then 

# Shebang which dynamically finds the bash executable
#!/usr/bin/env bash

# Select IP address & CIDR
ip addr s ens33 | grep "inet " | cut -f6 -d " "

# Select IP address without CIDR
ip addr s ens33 | grep "inet " | awk '{split($0,v,"inet "); print v[2]}' | awk '{split($0,v,"/"); print v[1]}'

# Run local script remotely over SSH
ssh tools@192.168.56.103 'bash -s' < get_host_info.sh

# Append to a variable
export PATH=/usr/local/bin:/usr/sbin:$PATH


https://github.com/dylanaraps/pure-bash-bible
https://home.adelphi.edu/~pe16132/csc271/ppt/SummaryToShells.htm




date +%F
2019-01-19

date +%d-%B-%Y
19-January-2019

date +%d-%m-%Y
19-01-2019

date "+%d %B %Y"
19 January 2019

date "+%H:%M:%S, %d %B %Y" -r orange-1.txt
16:35:09, 19 January 2019

date "+%H:%M:%S, %d/%m/%Y" -r orange-1.txt
16:42:20, 19/01/2019




create a bash script to list all ipv6 addresses from the output of "ip address"
	result=$(ip address)
	IPv6_addresses=$(echo "$result" | grep -o 'inet6 [^ ]*' | cut -d' ' -f2)
	echo "$IPv6_addresses"


create a bash script to remove all entries from the ip routing table
#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi
IP_ROUTES=$(route -n)
while read -r line; do
    NETWORK_ADDRESS=$(echo $line | awk '{print $1}')
    NETMASK=$(echo $line | awk '{print $3}')
    route del -net $NETWORK_ADDRESS netmask $NETMASK
done <<< "$IP_ROUTES"
echo "All entries removed from the IP routing table"



# PROMPTS
# Blueberries
export PS1="\[\e[38;5;33m\]\u\[\e[38;5;69m\]@\[\e[38;5;105m\]\h \[\e[38;5;141m\]\w \[\033[0m\]$ "

# ParrotOs
PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\]"
















------------------------------------------------------------------------


#!/bin/bash

# Remove undesirable characters from filenames
remov_char1=' '
subst_char1='-'
for filerename in ./*.*; do
    mv "$filerename" "${filerename//$remov_char1/$subst_char1}"
done

remov_char2='\('
subst_char2='-'
for filerename in ./*.*; do
    mv "$filerename" "${filerename//$remov_char2/$subst_char2}"
done

remov_char3='\)'
subst_char3='-'
for filerename in ./*.*; do
    mv "$filerename" "${filerename//$remov_char3/$subst_char3}"
done

# Find files matching an operator then 'echo' the filenames
for c in /home/intuitive/trash/*.txt; do echo "$c"; done

# Extract lines from a file which match a string (use 'sed' to remove desired parts of the string)
for c in /home/intuitive/trash/*.txt; do cat "$c" | grep "comment=" | sed 's!comment=!!'; done

# Extract lines from a file which match a string (use 'sed' to remove desired parts of the string)
for c in /home/intuitive/trash/*.txt; do grep "comment=" $c | sed 's!comment=!!'; done

-------------------------------------------------------------------------------
# CSV using quotation encapsulation with | delimiter
echo "FILENAME,TITLE,DESCRIPTION" >> /home/intuitive/trash/filelist.csv;
for x in `find /home/intuitive/trash/*.meta1 -type f`; do a=$(cat $x); echo -n "$a|" >> /home/intuitive/trash/filelist.csv; done;
echo "" >> /home/intuitive/trash/filelist.csv;
for y in `find /home/intuitive/trash/*.meta2 -type f`; do b=$(cat $y); echo -n "$b|" >> /home/intuitive/trash/filelist.csv; done;
echo "" >> /home/intuitive/trash/filelist.csv;
for z in `find /home/intuitive/trash/*.meta3 -type f`; do c=$(cat $z); echo -n "$c|" >> /home/intuitive/trash/filelist.csv; done;

# CSV using quotation encapsulation with comma delimiter
echo "FILENAME,TITLE,DESCRIPTION,DATE" >> /home/intuitive/trash/filelist.csv;
for w in `find /home/intuitive/trash/*.meta1 -type f`; do a=$(cat $w); echo -n "\"$a\"|" >> /home/intuitive/trash/filelist.sort; done;
echo "" >> /home/intuitive/trash/filelist.sort;
for x in `find /home/intuitive/trash/*.meta2 -type f`; do b=$(cat $x); echo -n "\"$b\"|" >> /home/intuitive/trash/filelist.sort; done;
echo "" >> /home/intuitive/trash/filelist.sort;
for y in `find /home/intuitive/trash/*.meta3 -type f`; do c=$(cat $y); echo -n "\"$c\"|" >> /home/intuitive/trash/filelist.sort; done;
echo "" >> /home/intuitive/trash/filelist.sort;
for z in `find /home/intuitive/trash/*.meta4 -type f`; do d=$(cat $z); echo -n "\"$d\"|" >> /home/intuitive/trash/filelist.sort; done;




# Counts number of files matching string and returns numeric value
vidcount=$(ls -l *.mp4 | grep -v ^l | wc -l)

# For # of values returned, do one interation of trim 'tr' and copy 'column' using delimiters
# for w in $(seq 1 $vidcount); do cut -d "|" -f $w /home/intuitive/trash/filelist.sort | tr '\n' '|' >> /home/intuitive/trash/filelist.csv; echo "" >> /home/intuitive/trash/filelist.csv; done
for w in $(seq 1 $vidcount); do cut -d "|" -f $w /home/intuitive/trash/filelist.sort | tr '\n' ',' >> /home/intuitive/trash/filelist.csv; echo "" >> /home/intuitive/trash/filelist.csv; done

# Copy columns from a file using a delimiter to identify the columns
cut -d "|" -f 2 /home/intuitive/trash/filelist.csv
cut -d "|" -f 3 /home/intuitive/trash/filelist.csv
cut -d "|" -f 4 /home/intuitive/trash/filelist.csv
cut -d "|" -f 5 /home/intuitive/trash/filelist.csv

# Use ffmpeg to extract metadata from media files, save to txt file, and conmvert to MP4
for k in /home/intuitive/trash/*.mp4; do ffmpeg -y -i "$k" -f ffmetadata "${k%.*}.txt"; done
for k in /home/intuitive/trash/*.avi; do ffmpeg -y -i "$k" -f ffmetadata "${k%.*}.txt" -movflags +faststart "${k%.*}.mp4"; done
for k in /home/intuitive/trash/*.mov; do ffmpeg -y -i "$k" -f ffmetadata "${k%.*}.txt" -movflags +faststart "${k%.*}.mp4"; done
for k in /home/intuitive/trash/*.flv; do ffmpeg -y -i "$k" -f ffmetadata "${k%.*}.txt" -movflags +faststart "${k%.*}.mp4"; done
for k in /home/intuitive/trash/*.wmv; do ffmpeg -y -i "$k" -f ffmetadata "${k%.*}.txt" -movflags +faststart "${k%.*}.mp4"; done
for k in /home/intuitive/trash/*.m4v; do ffmpeg -y -i "$k" -f ffmetadata "${k%.*}.txt" -movflags +faststart "${k%.*}.mp4"; done

# Echo filename of found file, and save it to contents of file
for d in `find /home/intuitive/trash/*.mp4 -type f \( ! -path '*/BACKUPS/*' ! -path '*/@eaDir/*' ! -path '*/.DS_Store/*' \)`; do echo $d | sed 's!/home/intuitive/trash/!!' > "${d%}.meta1"; done;
# Use 'awk' to locate line in file matching string then save contents to file, and use 'sed' to remove unwanted part of string
for e in `find /home/intuitive/trash/*.txt -type f \( ! -path '*/filelist.txt*' ! -path '*/humanlist.txt*' ! -path '*/*.metadata/*' \)`; do awk '/title=/' $e | sed 's!title=!!' > "${e%}.meta2"; done;
for f in `find /home/intuitive/trash/*.txt -type f \( ! -path '*/filelist.txt*' ! -path '*/humanlist.txt*' ! -path '*/*.metadata/*' \)`; do awk '/comment=/' $f | sed 's!comment=!!' > "${f%}.meta3"; done;
for g in `find /home/intuitive/trash/*.mp4 -type f \( ! -path '*/filelist.txt*' ! -path '*/humanlist.txt*' ! -path '*/*.metadata/*' \)`; do date "+%H:%M:%S, %d/%m/%Y" -r $g > "${g%}.meta4"; done;




# Find files matching string, use 'sed' to remove unwanted part of string and save to file
find /home/intuitive/trash/*.mp4 -type f ! -path '*/BACKUPS/*' ! -path '*/@eaDir/*' ! -path '*/.DS_Store/*' | sed 's!/home/intuitive/trash!!' > /home/intuitive/trash/filelist.txt
vidcount=$(ls -l *.mp4 | grep -v ^l | wc -l)
echo "-----------------------------------------------" >> /home/intuitive/trash/humanlist.txt
echo "*** THISFILE:" `date "+%H:%M:%S, %d/%m/%Y"` >> /home/intuitive/trash/humanlist.txt
echo "*** CSV FILE:" `date "+%H:%M:%S, %d/%m/%Y" -r /home/intuitive/trash/filelist.csv` >> /home/intuitive/trash/humanlist.txt
echo "*** SORTFILE:" `date "+%H:%M:%S, %d/%m/%Y" -r /home/intuitive/trash/filelist.sort` >> /home/intuitive/trash/humanlist.txt
echo "*** MP4 VIDEO COUNT:" $vidcount >> /home/intuitive/trash/humanlist.txt
echo "-----------------------------------------------" >> /home/intuitive/trash/humanlist.txt

