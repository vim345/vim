" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
  set smartindent
  set tabstop=2
  set shiftwidth=2
  set expandtab
endif


" Set the color scheme
colorscheme mohammad


" Custom mappings for Django.
map ,m :vsplit %:p:h/models.py<CR>
map ,v :vsplit %:p:h/views.py<CR>
map ,u :vsplit %:p:h/urls.py<CR>
map ,tm :tabedit %:p:h/models.py<CR>
map ,tv :tabedit %:p:h/views.py<CR>
map ,tu :tabedit %:p:h/urls.py<CR>
