function! g:Select_full_form()
  let topline = 0
  let bottomline = line('$')
  let lines = getline(topline, bottomline)
  let section = join(lines, "\n")
  return [topline, bottomline, section]
endfunction

function! parinfer#draw(res, top, bottom)
  let lines = split(a:res, "\n")
  let counter = a:top + 1
  for line in lines
    call setline(counter, line)
    let counter += 1
  endfor
  redraw!
endfunction

function! parinfer#indent()
  let save_cursor = getpos(".")
  let data = g:Select_full_form()
  let form = data[2]
  let res = parinfer_lib#IndentMode(form, {})
  let text = res.text
  call parinfer#draw(text, data[0], data[1])
  " reset cursor to where it was
  call setpos('.', save_cursor)
endfunction

function! parinfer#paren()
  let save_cursor = getpos(".")
  let data = g:Select_full_form()
  let form = data[2]
  let res = parinfer_lib#ParenMode(form, {})
  let text = res.text
  call parinfer#draw(text, data[0], data[1])
  call setpos('.', save_cursor)
endfunction

augroup parinfer
  autocmd!
  autocmd FileType clojure nnoremap <buffer> <F7> :call parinfer#indent()<cr>
  autocmd FileType clojure nnoremap <buffer> <F8> :call parinfer#paren()<cr>
augroup END
