# appkeylayout
Keeps keyboard layout between appliaction windows.

This is a bash script that keeps track of keyboard layout for different application windows. It 
uses "xdotool" so you should have that installed. It is a simple loop that sleeps for 1 second and checks the active window and its process ID. If it's a new process ID it stores it and its keyboard layout which is obtained over "gdbus". 

Requirements
- linux (tested on Ubuntu 18.04)
- xdotool

Installation
1. Download or clone the source in a directory, e.g. "$HOME/appkeylayout"
2. Make it executable: 
> chmod +x $HOME/appkeylayout/appkeylaout.sh
3. Add this line to $HOME/.profile
> nohup $HOME/appkeylayout/appkeylayout.sh &>>/tmp/appkeylayout.log &
4. Logoff and logon. If you don't want that, just execute the previous command.