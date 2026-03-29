#!/usr/bin/env bash

EVEBACKUPDIR="/home/intuitive/backups"
EVEBACKUPDATE=$(date "+%Y-%m-%d_%H-%M")

mkdir ${EVEBACKUPDIR}

find -P /opt/unetlab/labs -mindepth 0 -maxdepth 10 -type f \( ! -iname "*.bin" ! -iname "*.qcow2" \) -exec zip -r ${EVEBACKUPDIR}/${EVEBACKUPDATE}-LABS.zip {} \;
find -P /opt/unetlab/tmp -mindepth 0 -maxdepth 10 -type f \( ! -iname "*.bin" ! -iname "*.qcow2" \) -exec zip -r ${EVEBACKUPDIR}/${EVEBACKUPDATE}-CONFIGS.zip {} \;

