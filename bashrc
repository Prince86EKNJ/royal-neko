# Include user "bin" dir
PATH=$PATH:~/bin
PATH=$PATH:~/royal-neko/bin

# custom bash prompt
PS1="\n\[$(tput setaf 2)\]\u\[$(tput setaf 7)\]@\[$(tput setaf 1)\]\h\[$(tput setaf 7)\]:\[$(tput setaf 3)\]\w\n\[$(tput setaf 7)\]$ \[$(tput sgr0)\]"

# Include default aliases
. ~/royal-neko/alias

# Run archey if it exists
if [ -x /usr/bin/archey ]; then
	/usr/bin/archey
fi

# source the nvm file if it exists
if [ -x ~/.nvm/nvm.sh ]; then
. ~/.nvm/nvm.sh
fi

# Load mobile-mode on port SSH Port 2222
SSH_INCOMING_PORT=$(echo $SSH_CONNECTION | cut -d' ' -f4)
#echo Port $SSH_INCOMING_PORT
if [ "$SSH_INCOMING_PORT" == "2222" ]; then
	echo "Mobile Mode enabled"
	. ~/royal-neko/mobile/mobile-mode
fi
