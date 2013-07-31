function! LatexFolds()
	let thisline = getline(v:lnum)
	if match(thisline, '\\begin{figure}') >=0
		return ">10"
	elseif match(thisline, '\\end{figure}') >=0
		return "<10"
	elseif match(thisline, '\\begin{equation}') >= 0
		return ">11"
	elseif match(thisline, '\\end{equation}') >= 0
		return "<11"
	elseif match(thisline, '\\chapter') >= 0
		return ">1"
	elseif match(thisline, '\\section') >= 0
		return ">2"
	elseif match(thisline, '\\subsection') >= 0
		return ">3"
	elseif match(thisline, '\\subsubsection') >= 0
		return ">4"
	else
		return "="
	endif
endfunction

setlocal foldmethod=expr
setlocal foldexpr=LatexFolds()
