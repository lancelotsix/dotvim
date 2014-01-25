" Use pathogen to easealy use vim plugins versionned with git
execute pathogen#infect()

" Usual configs
syntax enable
set background=dark
colorscheme solarized

" Use <F8> to launch tagbar
nmap <F8> :TagbarToggle<CR>
" Use <F7> to launch history br
nmap <F7> :GundoToggle<CR>


filetype plugin indent on
set number
set laststatus=2

if has('gui_running')
	set guifont=Monospace\ 8
endif

set vb

" Enable file type detection
filetype on

" Display special invisible chars
set listchars=tab:�\ ,eol:�

autocmd FileType ada setlocal ts=3 sts=3 sw=3 expandtab
autocmd FileType modula2 setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType cpp setlocal ts=4 sts=4 sw=4 expandtab

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

