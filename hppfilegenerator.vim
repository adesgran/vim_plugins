function! s:generate_hpp()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  let classname = expand("%:r")
  execute "normal! i#ifndef " . gatename
  execute "normal! o# define " . gatename . "\n"
  execute "normal! o# define DEBUG 1\n"
  execute "normal! o# include <iostream>"
  execute "normal! o# include <string>\n"
  execute "normal! oclass " . classname ." {"
  execute "normal! opublic:"
  execute "normal! o" . classname ."( void );"
  execute "normal! o" . classname ."( const " . classname . " &" . tolower(classname) . " );"
  execute "normal! o~" . classname ."( void );"
  execute "normal! o" . classname ." &operator=( const " . classname . " &" . tolower(classname) . " );"
  execute "normal! o"
  execute "normal! xi"
  execute "normal! o"
  execute "normal! oprivate:"
  execute "normal! o"
  execute "normal! o};"
  execute "normal! o"
  execute "normal! o#endif"
endfunction

autocmd BufNewFile *.hpp call <SID>generate_hpp()
