
Y:
cd Y:\UTILITIES\Goldmine\

for %%f in (*.ocx *.dll) do regsvr32 /s %%f

pause
exit
