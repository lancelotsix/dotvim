" Use pathogen to easealy use vim plugins versionned with git
execute pathogen#infect()

" Usual configs
syntax enable

" Prefered colour scheme
if has('gui_running')
	set guifont=Monospace\ 8
	set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 9
	colorscheme solarized
else
	colorscheme desert
endif

" Use <F8> to launch tagbar
nmap <F8> :TagbarToggle<CR>
" Use <F7> to launch history br
nmap <F7> :GundoToggle<CR>


filetype plugin indent on
set number
set laststatus=2

set vb

" Enable file type detection
filetype on

" Display special invisible chars
set listchars=tab:�\ ,eol:�

autocmd FileType ada setlocal ts=3 sts=3 sw=3 expandtab
autocmd FileType modula2 setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType cpp setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType hs setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab

autocmd BufWritePre *.def,*.mod :call <SID>StripTrailingWhitespaces()

" Delete fugitive buffer as we close them
autocmd BufReadPost fugitive://* set bufhidden=delete

" Status line show current git branch
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Define usefull functions
function! <SID>StripTrailingWhitespaces()
	" Save curent state
	let _s=@/
	let l=line(".")
	let c=col(".")
	" Remote trailing spaces
	%s/\s\+$//e
	let @/=_s
	call cursor(l, c)
endfunction


map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>
let g:syntastic_auto_loc_list=1
" Reload
map <silent> tu :call GHC_BrowseAll()<CR>
" Type Lookup
map <silent> tw :call GHC_ShowType(1)<CR>

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

autocmd BufEnter *.hs set formatprg=pointfree

set backspace=indent,eol,start

let g:syntastic_auto_loc_list = 0
let g:pymode = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_folding = 1
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint', 'pep257']
let g:pymode_lint_ignore = ""
let g:pymode_lint_sort = ['E', 'C', 'I']
let g:pymode_lint_unmodified = 1
let g:pymode_rope = 0
let g:pymode_rope_show_doc_bind = 'K'
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_slow_sync = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all

if !empty(system("setxkbmap -print|grep bepo"))
	source ~/.vim/vimrc.bepo
endif
