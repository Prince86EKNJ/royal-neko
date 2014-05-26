""""""""""""
" Settings "
""""""""""""
set number
set listchars=eol:$,tab:>-,precedes:<,extends:>
set nowrap
set wildmode=longest,list
set hlsearch
set incsearch

syntax on

""""""""""""
" Mappings "
""""""""""""
noremap <Leader>yw m`bye``
noremap <Leader>yy 0y$

""""""""""""
" Commands "
""""""""""""
command! ClearSearch let @/=''

command! EditVimrc vnew ~/royal-neko/vimrc
command! ReloadVimrc source ~/royal-neko/vimrc
command! SaveAndReloadVimrc write | ReloadVimrc
