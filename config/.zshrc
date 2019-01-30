#!/usr/bin/zsh
if [ -z "$NEKO" ]; then
  export NEKO="$HOME/royal-neko"
  PATH="$NEKO/bin:$PATH"
fi

source "$NEKO/shell/commonrc"

# Options
setopt \
  append_history automenu autonamedirs braceccl cdablevars noclobber \
  nocorrect extendedhistory hist_ignore_dups hist_ignore_space hist_no_functions \
  nohistverify pushdignoredups rcquotes sharehistory

# Environment variables / settings
export HISTFILE="$HOME/.history"
export HISTSIZE=1000000
export SAVEHIST="$HISTSIZE"

alias help='info zsh "Shell Builtin Commands"'
alias mobile-mode='source $NEKO/mobile/zsh-mobile'

# global aliases
alias -g 'G+'='| grep' # Grep
alias -g 'J+'='| to-json'
alias -g 'L+'='| lines' # Lines
alias -g 'NE+'='2>/dev/null' # no error, or NULL error
alias -g 'NS+'='--name-status' # git option
alias -g 'Q+'='> /dev/null 2>&1' # Quiet - no stdout or stderr
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
%(?..%F{red}=> %?
)%F{white}%B[%h]%b %F{cyan}%n%f at %F{green}%M%f in %F{yellow}%~%f
$ '

# completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=1

autoload -Uz compinit
compinit

auto_source=(
  "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  "$HOME/.neko/.zshrc"
)

for file in $auto_source; do
  if [ -f "$file" ]; then
    source "$file"
  fi
done

# extra

# highlight stderr in red
# exec 2>>( while read X; do print "\e[91m${X}\e[0m" > /dev/tty; done & )
