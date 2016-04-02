#!/usr/bin/zsh
source ~/royal-neko/commonrc
if [ -f ~/royal-neko/local/zshrc ]; then
	source ~/royal-neko/local/zshrc
fi

# Options
setopt append_history
setopt autocd
setopt automenu
setopt autonamedirs
setopt braceccl
setopt cdablevars
setopt noclobber
setopt nocorrect
setopt extendedhistory
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_functions
setopt nohistverify
setopt pushdignoredups
setopt rcquotes

# Environment variables / settings
export HISTFILE="$HOME/.history"
export HISTSIZE=999
export SAVEHIST="$HISTSIZE"

# Default bookmarks
export neko="$HOME/royal-neko"
export os="$neko/os/arch"

alias help='info zsh "Shell Builtin Commands"'
alias mobile-mode='source ~/royal-neko/mobile/zsh-mobile'

# global aliases
alias -g 'G+'='| grep' # Grep
alias -g 'J+'='| to-json'
alias -g 'L+'='| lines' # Lines
alias -g 'NE+'='2>/dev/null' # no error, or NULL error
alias -g 'NS+'='--name-status' # git option
alias -g 'Q+'='>/dev/null 2>&1' # Quiet - no stdout or stderr
alias -g 'X+'='| xargs -n1 -i' # Xargs

# keymap
bindkey -e # emacs
bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search

if [ -n "$TMUX" ]; then
    bindkey "^[OC" forward-word
    bindkey "^[OD" backward-word
else
    bindkey "^{[1;5C" forward-word
    bindkey "^{[1;5D" backward-word
fi

bindkey "^[[3~" delete-char # del key

prompt=$'
%F{cyan}%n%f at %F{green}%m%f in %F{yellow}%~%f
$ '

# completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=1

autoload -Uz compinit
compinit

# highlighting
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# highlight stderr in red
# exec 2>>( while read X; do print "\e[91m${X}\e[0m" > /dev/tty; done & )

# reminder
echo "Make sure you do these things regularly:"
echo "* Update royal-neko"
echo "* Update packages"
echo "* Update git projects"
echo "* Update emacs packages"
