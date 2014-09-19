source ~/royal-neko/commonrc

# custom bash prompt
PS1="\n\[$(tput setaf 6)\]\u\[$(tput setaf 7)\]@\[$(tput setaf 2)\]\h\[$(tput setaf 7)\]:\[$(tput setaf 3)\]\w\n\[$(tput setaf 7)\]$ \[$(tput sgr0)\]"

# Load mobile-mode on port SSH Port 2222
SSH_INCOMING_PORT=$(echo $SSH_CONNECTION | cut -d' ' -f4)
#echo Port $SSH_INCOMING_PORT
if [ "$SSH_INCOMING_PORT" == "2222" ]; then
	echo "Mobile Mode enabled"
	source ~/royal-neko/mobile/mobile-mode
fi
