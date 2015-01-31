" Guarantees that this file is only loaded once
if !exists("g:royalHimeVimrcLoaded") || g:royalHimeVimrcLoaded == 0

	let g:royalHimeVimrcLoaded = 1

	""""""""""""
	" Settings "
	""""""""""""
	set autoindent
	set hlsearch
	set incsearch
	set listchars=eol:$,tab:>-,precedes:<,extends:>
	set modeline
	set nowrap
	set number
	set showcmd
	set smartcase
	set smartindent
	set wildmode=longest,list

	syntax on

	"""""""""""""""""
	" Abbreviations "
	"""""""""""""""""
	abbr ftJS /* vim: set filetype=javascript : */
	abbr ftHtml <!-- vim: set filetype=html : -->

	""""""""""""
	" Commands "
	""""""""""""
	command! ClearSearch let @/=''

	command! WhitespaceHighlight normal /\s\+$<CR>
	command! WhitespaceCleanup %s/\s\+$//gc

	command! EditVimrc vnew ~/royal-neko/vimrc
	command! ReloadVimrc source ~/royal-neko/vimrc
	command! SaveAndReloadVimrc write | ReloadVimrc

	command! SimpleSave set nowritebackup|set noswapfile

	""""""""""""
	" Mappings "
	""""""""""""
	noremap <Leader>e :EditVimrc<CR>
	noremap <Leader>h :WhitespaceHighlight<CR>
	noremap <Leader>l :vnew .vimrc<CR>
	noremap <Leader>n :set invrelativenumber<CR>
	noremap <Leader>r :let g:royalHimeVimrcLoaded=0<CR>:SaveAndReloadVimrc<CR>
	noremap <Leader>w :WhitespaceCleanup<CR>
	noremap <Leader>yw m`bye``
	noremap <Leader>yy m`0y$``
	noremap <Leader>YY m`^yg_``

	""""""""""""
	" Snippets "
	""""""""""""
	let snippet = {}
	let snippet['log'] = 'console.log(!!!);'
	let snippet['func'] = 'function(!!!){!!!}'
	let snippet['Func'] = 'function(!!!) { !!! }'
	let snippet['des'] = 'describe("!!!", function(){!!!});'
	let snippet['it'] = 'it("!!!", function(){!!!});'
	let snippet['ex'] = 'expect(!!!).to.equal(!!!);'

	inoremap \r <Esc>vbcvar <C-R>" = require("<C-R>"");
	inoremap \q <Esc>vbc<C-O>m`<C-R>=snippet[@"]<CR><Esc>``/!!!<CR>:ClearSearch<CR>c3l
	inoremap \<Tab> <Esc>/!!!<CR><Esc>:ClearSearch<CR>c3l

	let localVimrc = $HOME."/royal-neko/local/vimrc"
	if filereadable(localVimrc)
		exec "source ".localVimrc
	endif

	if filereadable(".vimrc")
		source .vimrc
	endif
endif
