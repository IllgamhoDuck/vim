function! Sorted(l)
    let new_list = deepcopy(a:l)
    call sort(new_list)
    return new_list
endfunction

function! Reversed(l)
    let new_list = deepcopy(a:l)
    call reverse(new_list)
    return new_list
endfunction

function! Append(l, val)
    let new_list = deepcopy(a:l)
    call add(new_list, a:val)
    return new_list
endfunction

"testing dictionary function-----{{{
function! TestDict(key, val)
    return a:key . '_duck_' . a:val
endfunction
"}}}

function! Assoc(l, i, val)
    let new_list = deepcopy(a:l)
    let new_list[a:i] = a:val
    return new_list
endfunction

function! Pop(l, i)
    let new_list = deepcopy(a:l)
    call remove(new_list, a:i)
    return new_list
endfunction

function! Mapped(fn, l)
    if type(a:l) ==# type([])
	let new_list = deepcopy(a:l)
	call map(new_list, string(a:fn) . '(v:val)')
	return new_list
    elseif type(a:l) ==# type({})
	let new_dict = deepcopy(a:l)
	call map(new_dict, string(a:fn) . '(v:key, v:val)')
	return new_dict
endfunction

function! Filtered(fn, l)
    if type(a:l) ==# type([])
	let new_list = deepcopy(a:l)
	call filter(new_list, string(a:fn) . '(v:val)')
	return new_list
    elseif type(a:l) ==# type({})
	let new_dict = deepcopy(a:l)
	call filter(new_dict, string(a:fn) . '(v:key, v:val)')
	return new_dict
endfunction

function! Removed(fn, l)
    if type(a:l) ==# type([])
	let new_list = deepcopy(a:l)
	call filter(new_list, '!' . string(a:fn) . '(v:val)')
	return new_list
    elseif type(a:l) ==# type({})
	let new_dict = deepcopy(a:l)
	call filter(new_dict, '!' . string(a:fn) . '(v:key, v:val)')
	return new_dict
endfunction

" making the reduced function
" This time it doens't require function() preprocessing
" Because it will be handled inside this function
" let mylist = [1,2,3]
" let mydict = {'a': 1, 'b': 2, 'c': 3}
" echo Reduced(function("Add"), mylist)
" echo Reduced(function("Add"), mydict)
function! Add(a, b)
    return a:a + a:b
endfunction

function! Max(a, b)
    return a:a > a:b ? a:a : a:b
endfunction

function! Min(a, b)
    return a:a < a:b ? a:a : a:b
endfunction

function! Reduced(fn, l)
    if empty(a:l) || len(a:l) <= 1
	return ''
    endif
    if type(a:l) ==# type([])
	let new_list = deepcopy(a:l)
    elseif type(a:l) ==# type({})
	let new_list = values(deepcopy(a:l))
    else
	return ''
    endif
    let acc = new_list[0]
    for val in new_list[1:]
	let acc = a:fn(acc, val)
    endfor
    return acc
endfunction
