function! s:generate_h()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o# define " . gatename . "\n"
  execute "normal! o# include <unistd.h>"
  execute "normal! o# include <stdio.h>"
  execute "normal! o# include <stdlib.h>"
  execute "normal! o# include <libft.h>\n"
  execute "normal! o#endif"
endfunction

autocmd BufNewFile *.h call <SID>generate_h()
