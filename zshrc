source ~/royal-neko/commonrc
if [ -e ~/royal-neko/local/zshrc ]; then
	source ~/royal-neko/local/zshrc
fi

setopt autocd
setopt automenu
setopt autonamedirs
setopt braceccl
setopt cdablevars
setopt noclobber
setopt nocorrect
setopt extendedhistory
setopt nohistverify
setopt pushdignoredups
setopt rcquotes

alias help='info zsh "Shell Builtin Commands"'
alias mobile-mode='source ~/royal-neko/mobile/zsh-mobile'

alias -g SILENT='>/dev/null 2>&1'

# keymap
bindkey -e # emacs
bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search
bindkey "^{[1;5C" forward-word
bindkey "^{[1;5D" backward-word

prompt=$'
%F{cyan}%n%f at %F{green}%m%f in %F{yellow}%~%f
$ '
