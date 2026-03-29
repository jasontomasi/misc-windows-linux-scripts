@echo on
echo Removing +h +r +s attributes from Desktop.ini...
attrib /s -H -R -S "C:\..\desktop.ini"

echo Removing Desktop.ini...
del /q /s "C:\..\desktop.ini"

echo Removing NTFS ADS...
Y:\UTILITIES\sysinternals\streams.exe -s -d C:\

exit
