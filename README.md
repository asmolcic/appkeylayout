# appkeylayout
Keeps keyboard layout between appliaction windows.

This is a bash script that keeps track of keyboard layout for different application windows. It 
uses "xdotool" so you should have that installed. It is a simple loop that sleeps for 1 second and checks the active window and its process ID. If it's a new process ID it stores it and its keyboard layout which is obtained over "gdbus". 


## Requirements
- Linux (tested on Ubuntu 18.04)
- xdotool - If you don't have it, execute:
> sudo apt-get install xdotool

## Installation
1. Download or clone the source in a directory, e.g. "$HOME/appkeylayout" (the scripts should already be executable)
2. Add this line to $HOME/.profile
> nohup $HOME/appkeylayout/appkeylayout.sh &>>/tmp/appkeylayout.log &
3. Logoff and logon. If you don't want that just execute the previous command.

## Files
- appkeylayout.sh: The script.
- printactivewin.sh - Helper script for testing stuff.

## Debugging
If you want to debug the script, you can stop the currently runing process and start it with the debug option like this.
> $HOME/appkeylayout/appkeylayout.sh 1

## Disclaimer
By using this software you are accepting and agreeing with all the terms and conditions in provided files.
- The license is GPL v3.
- Use at you own risk! 
- This software is not affiliated in any way with any company in which I am working for, have worked for or will work for and such companies are not responsible for any effects of this software.
