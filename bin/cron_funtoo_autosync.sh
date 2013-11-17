#Update the funtoo's portage tree daily.
#!/bin/bash
 
log="/var/log/autosync.log"
 
if [ ! -f $log ]; then
	touch $log
	chmod 600 $log
	chown root:root $log
fi
 
echo >> $log
echo "*** autosync started! ($(date +'%d-%m-%Y %H:%M:%S'))" >> $log
echo "*** running emerge --sync" >> $log
emerge -q --sync >> $log 2>&1
if [ -f /usr/bin/layman ]; then
	echo >> $log
	echo "*** running layman -S" >> $log
	/usr/bin/layman -S --nocolor >> $log 2>&1
fi


