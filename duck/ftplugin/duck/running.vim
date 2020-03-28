if !exists("g:duck_command")
    let g:duck_command = "python"
endif

function! DuckCompileAndRunFile()
    silent !clear
    execute "!" . g:duck_command . " " . bufname("%")
endfunction

function! DuckShowResult()
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

nnoremap <buffer> <localleader>r :call DuckCompileAndRunFile()<cr>
nnoremap <buffer> <localleader>b :call DuckShowResult()<cr>
