function! s:generate_cpp()
	let filename = expand("%:r")
	if (filename[0] >= 'A' && filename[0] <= 'Z')
		execute "normal! i#include <" . filename . ".hpp>"
		execute "normal! o"
		execute "normal! o" . filename . "::" . filename . "(void)"
		execute "normal! o{"
		execute "normal! oif (DEBUG)"
		execute "normal! ostd::cout << \"\\033[0;34m" . filename . " default Contructor called\\033[0m\" << std::endl;"
		execute "normal! o}"
		execute "normal! o"
		execute "normal! o" . filename . "::" . filename . "(const " . filename . " &" . tolower(filename) . ")"
		execute "normal! o{"
		execute "normal! oif (DEBUG)"
		execute "normal! ostd::cout << \"\\033[0;34m" . filename . " copy Contructor called\\033[0m\" << std::endl;"
		execute "normal! o}"
		execute "normal! o"
		execute "normal! o" . filename . "::~" . filename . "(void)"
		execute "normal! o{"
		execute "normal! oif (DEBUG)"
		execute "normal! ostd::cout << \"\\033[0;34m" . filename . " Destructor called\\033[0m\" << std::endl;"
		execute "normal! o};"
		execute "normal! o"
		execute "normal! o" . filename . " &" . filename . "::operator=(const " . filename . " &" . tolower(filename) . ")"
		execute "normal! o{"
		execute "normal! oif (DEBUG)"
		execute "normal! ostd::cout << \"\\033[0;34m" . filename . " copy Operator called\\033[0m\" << std::endl;"
		execute "normal! o}"
		execute "normal! o"
	endif
endfunction

augroup CFiles
	autocmd!
	autocmd BufNewFile *.cpp call <SID>generate_cpp()
augroup END
