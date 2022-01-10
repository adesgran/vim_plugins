function! s:generate_main()
	execute "normal! iint\tmain(int ac, char **av)"
	execute "normal! o{"
	execute "normal! o(void)ac;"
	execute "normal! o(void)av;"
	execute "normal! oreturn (0);"
	execute "normal! o}"
endfunction

command! Generatemain call s:generate_main ()
map <F2> :Generatemain<CR>

augroup CFiles
	autocmd!
	autocmd BufNewFile main.c call <SID>generate_main()
augroup END
