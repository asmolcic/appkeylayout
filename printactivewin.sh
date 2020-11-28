#ACTWIN=$(xdotool getactivewindow)
ACTWINPID=$(xdotool getactivewindow getwindowpid)
#XACTWIN=$(printf 0x%x $ACTWIN)
#xwininfo -root -tree | grep $XACTWIN
echo $ACTWINPID
