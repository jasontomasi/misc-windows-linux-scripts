mkdir %temp%\BOOT-TRACE\

xbootmgr -trace boot -traceFlags BASE+CSWITCH+DRIVERS+POWER -resultPath %temp%\BOOT-TRACE\

wpr -boottrace -addboot generalprofile -addboot cpu -addboot diskio -filemode -recordtempto %temp%\BOOT-TRACE\
