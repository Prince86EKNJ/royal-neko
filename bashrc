# Include user "bin" dir
PATH=$PATH:~/bin

# Include default aliases
. ~/royal-neko/alias

# Run archey if it exists
if [ -x /usr/bin/archey ]; then
	/usr/bin/archey
fi

# source the nvm file if it exists
# TODO: Add check for nvm file
. ~/.nvm/nvm.sh

# Load mobile-mode on port SSH Port 2222
SSH_INCOMING_PORT=$(echo $SSH_CONNECTION | cut -d' ' -f4)
#echo Port $SSH_INCOMING_PORT
if [ "$SSH_INCOMING_PORT" == "2222" ]; then
	echo "Mobile Mode enabled"
	. ~/royal-neko/mobile/mobile-mode
fi
