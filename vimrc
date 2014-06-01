""""""""""""
" Settings "
""""""""""""
set number
set listchars=eol:$,tab:>-,precedes:<,extends:>
set nowrap
set wildmode=longest,list
set hlsearch
set incsearch
set autoindent

syntax on

""""""""""""
" Commands "
""""""""""""
command! ClearSearch let @/=''

command! EditVimrc vnew ~/royal-neko/vimrc
command! ReloadVimrc source ~/royal-neko/vimrc
command! SaveAndReloadVimrc write | ReloadVimrc

""""""""""""
" Mappings "
""""""""""""
noremap <Leader>e :EditVimrc<CR>
noremap <Leader>r :SaveAndReloadVimrc<CR>
noremap <Leader>l :vnew .vimrc<CR>
noremap <Leader>yw m`bye``
noremap <Leader>yy 0y$

"""""""""""""""""""""""""""""""""""""""
" Add .vimrc (if one exists) from CWD "
"""""""""""""""""""""""""""""""""""""""

if filereadable(".vimrc")
	source .vimrc
endif
