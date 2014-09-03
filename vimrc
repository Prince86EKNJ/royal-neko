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

""""""""""""
" Snippets "
""""""""""""
let snippet = {}
let snippet['log'] = 'console.log(!!!);'
let snippet['func'] = 'function(){!!!}'
let snippet['Func'] = 'function() { !!! }'
let snippet['des'] = 'describe("!!!", function(){});'
let snippet['it'] = 'it("!!!", function(){});'
let snippet['ex'] = 'expect(!!!).to.equal();'

inoremap \r <Esc>bywivar <C-O>A = require("<C-R>"");
inoremap \q <Esc>bcw<C-R>=snippet[@"]<CR>?!!!<CR>c3l

"""""""""""""""""""""""""""""""""""""""
" Add .vimrc (if one exists) from CWD "
" but only if it's not this one       "
"""""""""""""""""""""""""""""""""""""""
let s:path = expand('<sfile>')
if filereadable(".vimrc") && s:path != $MYVIMRC
	source .vimrc
endif
