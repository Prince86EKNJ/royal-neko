source ~/royal-neko/commonrc
if [ -e ~/royal-neko/local/zshrc ]; then
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

alias help='info zsh "Shell Builtin Commands"'
alias mobile-mode='source ~/royal-neko/mobile/zsh-mobile'

# global aliases
alias -g 'G+'='| grep' # Grep
alias -g 'L+'='| lines' # Lines
alias -g 'Q+'='>/dev/null 2>&1' # Quiet - no stdout or stderr
alias -g 'SO+'='SOUT+' # only print StdOUT
alias -g 'X+'='| xargs ' # Xargs

# keymap
bindkey -e # emacs
bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search
bindkey "^{[1;5C" forward-word
bindkey "^{[1;5D" backward-word
bindkey "^[OC" forward-word
bindkey "^[OD" backward-word

prompt=$'
%F{cyan}%n%f at %F{green}%m%f in %F{yellow}%~%f
$ '
