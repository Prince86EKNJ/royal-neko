""""""""""""
" Settings "
""""""""""""
set autoindent
set hlsearch
set incsearch
set listchars=eol:$,tab:>-,precedes:<,extends:>
set nowrap
set number
set smartcase
set smartindent
set wildmode=longest,list

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
abbreviate func! function()<CR>{<CR>}<ESC>kk$F(a
abbreviate Func! function() {}<ESC>F(a
abbreviate clog! console.log();<Esc>hi
abbreviate desc! describe("", function()<CR>{<CR>});<Esc>2k^f"a
abbreviate it! it("", function()<CR>{<CR>});<Esc>2k^f"a
abbreviate ex! expect().toEqual();<Esc>^f(a

""""""""""""
" Snippets "
""""""""""""
let snippet = {}
let snippet['log'] = 'console.log();F('
let snippet['func'] = 'function(){ }klx'

inoremap \r <Esc>bywivar <C-O>A = require("<C-R>"");
inoremap \q <Esc>bcw<C-R>=snippet[@"]<CR>a

"""""""""""""""""""""""""""""""""""""""
" Add .vimrc (if one exists) from CWD "
" but only if it's not this one       "
"""""""""""""""""""""""""""""""""""""""
let s:path = expand('<sfile>')
if filereadable(".vimrc") && s:path != $MYVIMRC
	source .vimrc
endif
