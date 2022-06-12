function! s:generate_cpp()
	let filename = expand("%:r")
	if (filename[0] >= 'A' && filename[0] <= 'Z')
		execute "normal! i#include <" . filename . ".hpp>"
		execute "normal! o"
		execute "normal! o" . filename . "::" . filename . "(void)"
		execute "normal! o{"
		execute "normal! o"
		execute "normal! o}"
		execute "normal! o"
		execute "normal! o" . filename . "::" . filename . "(const " . filename . " &" . tolower(filename) . ")"
		execute "normal! o{"
		execute "normal! o"
		execute "normal! o}"
		execute "normal! o"
		execute "normal! o" . filename . "::~" . filename . "(void)"
		execute "normal! o{"
		execute "normal! o"
		execute "normal! o};"
		execute "normal! o"
		execute "normal! o" . filename . " &" . filename . "::operator=(const " . filename . " &" . tolower(filename) . ")"
		execute "normal! o{"
		execute "normal! o"
		execute "normal! o}"
		execute "normal! o"
	endif
endfunction

augroup CFiles
	autocmd!
	autocmd BufNewFile *.cpp call <SID>generate_cpp()
augroup END
