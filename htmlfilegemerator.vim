function! s:htmlgenerator()
	let gatename = substitute(tolower(expand("%:t")), "\\.html", "", "g")
	execute "normal! i<!DOCTYPE html>"
	execute "normal! o<html>"
	execute "normal! o<head>"
	execute "normal! o<title>" . gatename . "</title>"
	execute "normal! o</head>"
	execute "normal! o<body>"
	execute "normal! o<h1>Hello World</h1>"
	execute "normal! o</body>"
	execute "normal! o</html>"
endfunction

autocmd BufNewFile *.html call <SID>htmlgenerator()
