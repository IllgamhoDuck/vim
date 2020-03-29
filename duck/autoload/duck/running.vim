" Python compilation helpping
" 
" 1. Compile
" 2. Compile and show the result in the vertically splited window
"
" To use go to the python file you want to compile and type
"
" 1. <localleader>r - just compile
" 2. <localleader>b - Show the compiled result in the left vertical window
"
" This is useful because you don't need to go out to the window everytime
" when you want to see the compiled result. You can immediately see the
" result in the left window and also it shows you the error message if there
" is too
"
" Note that this is using the autoload method so it will loaded when you
" run the script :) QUARK!

echom "Autoloading"

function! duck#running#DuckCompileAndRunFile()
    silent !clear
    execute "!" . g:duck_command . " " . bufname("%")
endfunction

function! duck#running#DuckShowResult()
    " save the current window
    let g:current_window_id = win_getid(winnr('$'))

    " Get the result
    let result = system(g:duck_command . " " . bufname("%"))

    " check is __Python_Result__ opened
    let result_buffer = bufnr("__Python_Result__")

    if result_buffer == -1
	" Open a new split and set it up
	vsplit __Python_Result__
	setlocal filetype=DuckResult
	setlocal buftype=nofile
	setlocal foldmethod=manual
    else
	" If buffer exist check is the file exist in window
	let exist_in_window = win_findbuf(result_buffer)

	if exist_in_window == []
	    "Doesn't exist at window"
	    vsplit
	    execute "b" . result_buffer
	else
	    "Exist at window"
	    execute win_id2win(exist_in_window[0]) . "wincmd w"
	endif
    endif

    " Insert the result
    normal! ggdG
    call append(0, split(result, '\v\n'))

    " Go back the the original file
    execute win_id2win(g:current_window_id) . "wincmd w"
endfunction
