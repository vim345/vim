" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
  set smartindent
  set tabstop=4
  set shiftwidth=4
  set expandtab
endif


" Set the color scheme
colorscheme mohammad

" Fix the difficult-to-read default setting for diff text highlighting.  The
" " bang (!) is required since we are overwriting the DiffText setting. The highlighting
" " for "Todo" also looks nice (yellow) if you don't like the "MatchParen" colors.
highlight! link DiffText MatchParen


" Custom mappings for Django.
map ,m :vsplit %:p:h/models.py<CR>
map ,v :vsplit %:p:h/views.py<CR>
map ,u :vsplit %:p:h/urls.py<CR>
map ,f :vsplit %:p:h/forms.py<CR>
map ,s :vsplit %:p:h/tests.py<CR>

map ,tm :tabedit %:p:h/models.py<CR>
map ,tv :tabedit %:p:h/views.py<CR>
map ,tu :tabedit %:p:h/urls.py<CR>
map ,tf :tabedit %:p:h/forms.py<CR>
map ,ts :tabedit %:p:h/tests.py<CR>

:iabbr #T # TODO(mohammad.mohtasham@openx.com):
