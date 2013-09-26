" Use pathogen to easealy use vim plugins versionned with git
execute pathogen#infect()

" Usual configs
syntax on
filetype plugin indent on
set number
set laststatus=2

set vb

" Enable file type detection
filetype on

" Display special invisible chars
set listchars=tab:·\ ,eol:¬

autocmd FileType ada setlocal ts=3 sts=3 sw=3 expandtab
autocmd FileType modula2 setlocal ts=2 sts=2 sw=2 noexpandtab

autocmd BufWritePre *.def,*.mod :call <SID>StripTrailingWhitespaces()

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

