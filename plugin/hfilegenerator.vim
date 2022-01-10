function! s:generate_h()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o# define " . gatename . "\n"
  execute "normal! o#endif"
  execute "normal! kO\n"
endfunction

autocmd BufNewFile *.h call <SID>generate_h()
