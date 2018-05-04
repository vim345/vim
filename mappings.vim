" Set Abbreviation
:ab #a assert False
:iabbr pdb import ipdb; ipdb.set_trace()


" Maping shortcut keys to tab switching
map <silent><C-S-l> :bnext<CR>
map <silent><C-s-h> :bprevious<CR>


" Erasing trailing whitespace
map <silent><C-S-e> :%s/\s\+$//<CR>


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

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

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
au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)

" Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)

" Open the Go Tag bar.
nmap <F8> :TagbarToggle<CR>

" Jump between errors in quickfix list.
map <leader>n :cnext<CR>
map <leader>m :cprevious<CR>
nnoremap <leader>a :cclose<CR>


"""""""""""""""""""""""""""" End of Go Specific mappings.


" Switch between files and tests.
let pattern = '\(\(_\(unit\)\?test\)\?\.\(cc\|go\|js\|py\)\|\(-inl\)\?\.h\)$'
nmap ,p :vsplit <C-R>=substitute(expand("%"), pattern, "." . expand("%:e"), "")<CR><CR>
nmap ,tp :tabedit <C-R>=substitute(expand("%"), pattern, "." . expand("%:e"), "")<CR><CR>
nmap ,t :vsplit <C-R>=substitute(expand("%"), pattern, "_test." . expand("%:e"), "")<CR><CR>
nmap ,tt :tabedit <C-R>=substitute(expand("%"), pattern, "_test." . expand("%:e"), "")<CR><CR>


" Syntastic mappings.
nmap <silent> <F3> :SyntasticCheck<CR>
nmap <silent> <F4> :SyntasticToggleMode<CR>


" Convert camelCase to under_score
" command CamelCaseTo :s#\(\<\u\l\+\|\l\+\)\(\u\)#\l\1_\l\2#g
" Convert each name_like_this to NameLikeThis in current line.
" command ToCamelCase :s#\(\%(\<\l\+\)\%(_\)\@=\)\|_\(\l\)#\u\1\2#g
