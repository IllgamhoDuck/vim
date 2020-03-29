if !exists("g:duck_command")
    let g:duck_command = "python"
endif

nnoremap <buffer> <localleader>r
	\ :call duck#running#DuckCompileAndRunFile()<cr>
nnoremap <buffer> <localleader>b
	\ :call duck#running#DuckShowResult()<cr>
