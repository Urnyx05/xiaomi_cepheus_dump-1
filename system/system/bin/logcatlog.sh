umask 022
LOGDIR=/data/local/log
LOGFILE=$LOGDIR"/logcatlog"

NUM_MAX=128
NUM_MIN=64

size=$(getprop persist.offlinelog.logcat.size)
if [ -z "$size" ]; then
	num=$NUM_MIN
else
	num=$(($size/10))
fi

if [ "$num" -gt "$NUM_MAX" ] || [ "$num" -lt "NUM_MIN" ]; then
        num=$NUM_MIN
fi

/system/bin/logcat -r 10240 -n $num -v threadtime -f $LOGFILE
