#!/bin/bash
LOG_PREFIX="AppKeyLayout"
SLEEP_SECONDS=1
LAST_ACTWINPID=
MIN_WINDOW_PID=1
declare -A PROCESS_LAYOUTS
DEBUG=$1

function log() {
    [[ $DEBUG == 1 ]] && print $1
}

function print() {
    echo "[$LOG_PREFIX] $@"
}

print "Debugging: $DEBUG"
print "Active..."


while true; do
	CURRENT_LAYOUT=$(gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.gnome.Shell.Eval "imports.ui.status.keyboard.getInputSourceManager().currentSource.index")
    ACTWINPID=$(xdotool getactivewindow getwindowpid)
    log "Active window PID: $ACTWINPID"
    if [[ $ACTWINPID != "" && $ACTWINPID -gt $MIN_WINDOW_PID ]]; then

    	log "Current layout=$CURRENT_LAYOUT, Active process=$ACTWINPID, Last process=$LAST_ACTWINPID"
        
        PROCESS_LAYOUT=${PROCESS_LAYOUTS[$ACTWINPID]}

        if [[ $LAST_ACTWINPID == $ACTWINPID || $PROCESS_LAYOUT == "" ]]; then
        	log "Old process $ACTWINPID"
        	if [[ $PROCESS_LAYOUT != $CURRENT_LAYOUT ]]; then
        		log "Storing new layout for old process $CURRENT_LAYOUT"
        		PROCESS_LAYOUTS[$ACTWINPID]=$CURRENT_LAYOUT
        	fi
        else
        	log "New process $ACTWINPID"
        	if [[ $PROCESS_LAYOUT != $CURRENT_LAYOUT ]]; then
        		[[ $DEBUG == 1 ]] && echo "Restoring old layout"
        		gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.gnome.Shell.Eval "imports.ui.status.keyboard.getInputSourceManager().inputSources[$PROCESS_LAYOUT].activate()"
        	fi
        fi

        LAST_ACTWINPID=$ACTWINPID
    else
        print "Invalid window PID: $ACTWINPID" 
    fi
    sleep $SLEEP_SECONDS	
done


