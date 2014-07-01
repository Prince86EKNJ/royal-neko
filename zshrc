source ~/royal-neko/commonrc

setopt autocd
setopt noautomenu
setopt autonamedirs
setopt braceccl
setopt cdablevars
setopt correct
setopt extendedhistory
setopt pushdignoredups
setopt rcquotes

alias help='info zsh "Shell Builtin Commands"'

bindkey -s 'qq' '`'
bindkey -s 'qQ' '~'
bindkey -s $'q\'' '~'

bindkey -s 'qo' '['
bindkey -s 'qp' ']'

bindkey -s 'qO' '{'
bindkey -s 'q9' '{'
bindkey -s 'qP' '}'
bindkey -s 'q0' '}'

bindkey -s 'q\e[A' '|'
bindkey -s 'q\e[B' '\\'
bindkey -s 'q\e[C' '>'
bindkey -s 'q\e[D' '<'
