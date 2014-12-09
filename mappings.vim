" Set Abbreviation
:ab #a assert False
:iabbr pdb import pdb; pdb.set_trace()


" Maping shortcut keys to tab switching
map <silent><C-S-l> :tabnext<CR>
map <silent><C-s-h> :tabprevious<CR>


" Erasing trailing whitespace
map <silent><C-S-p> :%s/\s\+$//<CR>


" Map directory listing
map <silent><F2> :sp %:h<CR>


" Maping shortcut keys for setting mouse
nnoremap <F6> :call ToggleMouse()<CR>
function! ToggleMouse()
  if &mouse == 'a'
    set mouse=
    echo "Mouse usage disabled"
  else
    set mouse=a
    echo "Mouse usage enabled"
  endif
endfunction


" Toggle Paste Mode
:set pastetoggle=<F9>


" Clean highlights with Ctrl+n
nmap <silent> <C-N> :silent noh<CR>


"""""""""""""""""""""""""""" Go Specific mappings.
" Show a list of interfaces which is implemented by the type under your cursor.
au FileType go nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor.
au FileType go nmap <Leader>i <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor.
au FileType go nmap <Leader>gd <Plug>(go-doc)

" open the definition/declaration in a new vertical, horizontal or tab.
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" Run, build, test, and coverage the code.
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)
"""""""""""""""""""""""""""" End of Go Specific mappings.
