" Set Abbreviation
:ab #a assert False
:iabbr pdb import pdb; pdb.set_trace()


" Maping shortcut keys to tab switching
map <silent><S-Right> :tabnext<CR>
map <silent><S-Left> :tabprevious<CR>


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


