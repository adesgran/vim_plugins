function! s:generate_main()
	execute "normal! i#include <stdio.h>\n"
	execute "normal! oint\tmain(int ac, char **av)"
	execute "normal! o{"
	execute "normal! oif (ac < 1)"
	execute "normal! oreturn (1);\n"
	execute "normal! oprintf(\"Hello World\");\n"
	execute "normal! o(void)av;"
	execute "normal! oreturn (0);"
	execute "normal! o}"
endfunction

augroup CFiles
	autocmd!
	autocmd BufNewFile main.c call <SID>generate_main()
augroup END
