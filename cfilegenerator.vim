function! s:generate_main()
	execute "normal! iint\tmain(int ac, char **av)"
	execute "normal! o{"
	execute "normal! o(void)ac;"
	execute "normal! o(void)av;"
	execute "normal! oreturn (0);"
	execute "normal! o}"
endfunction

function! s:helloworld()
	execute "normal! i#include <stdio.h>\n"
	execute "normal! oint\tmain(int ac, char **av)"
	execute "normal! o{"
	execute "normal! oprintf(\"Hello World !\\n\");"
	execute "normal! o(void)ac;"
	execute "normal! o(void)av;"
	execute "normal! oreturn (0);"
	execute "normal! o}"
endfunction

function! s:generate_c()
	let hfile = get(readdir('.', {n -> n =~ '.h$'}), 0) 
	execute "normal! i#include <" . hfile . ">"
endfunction

command! Generatemain call s:generate_main ()
map <F2> :Generatemain<CR>

augroup CFiles
	autocmd!
	autocmd BufNewFile main.c call <SID>generate_main()
	autocmd BufNewFile helloworld.c call <SID>helloworld()
	autocmd BufNewFile *.c call <SID>generate_c()
augroup END
