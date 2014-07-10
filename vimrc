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

command! WhitespaceHighlight normal /\s\+$<CR>
command! WhitespaceCleanup %s/\s\+$//gc

command! EditVimrc vnew ~/royal-neko/vimrc
command! ReloadVimrc source ~/royal-neko/vimrc
command! SaveAndReloadVimrc write | ReloadVimrc

""""""""""""
" Mappings "
""""""""""""
noremap <Leader>e :EditVimrc<CR>
noremap <Leader>r :SaveAndReloadVimrc<CR>
noremap <Leader>l :vnew .vimrc<CR>
noremap <Leader>w :WhitespaceCleanup<CR>
noremap <Leader>h :WhitespaceHighlight<CR>
noremap <Leader>yw m`bye``
noremap <Leader>yy m`0y$``

"""""""""""""""""
" Abbreviations "
"""""""""""""""""
abbreviate conlog console.log(");2hi

"""""""""""""""""""""""
" JavaScript mappings "
"""""""""""""""""""""""
inoremap <Leader>f function()<CR>{<CR>}<ESC>kk$F(a
inoremap <Leader>F function() {}<ESC>F(a

"""""""""""""""""""""""""""""""""""""""
" Add .vimrc (if one exists) from CWD "
" but only if it's not this one       "
"""""""""""""""""""""""""""""""""""""""

let s:path = expand('<sfile>')
if filereadable(".vimrc") && s:path != $MYVIMRC
	source .vimrc
endif
