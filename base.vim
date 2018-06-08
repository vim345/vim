" Automaticall load changes made to vimrc.
autocmd! bufwritepost .vimrc source %

"
" Pathogen call
call pathogen#infect()


" Enable 256 color schema in vimdiff.
set t_Co=256

" Enable relative number
set relativenumber


" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif


" Add automatic indent support.
filetype plugin indent on


" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
"set ignorecase     " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set autowrite       " Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
set mouse=a         " Enable mouse usage (all modes)
set ruler           " Add ruler to status bar.
set tabpagemax=30   " Max number of open tabs.


" Set the width to 80 for Python and 130 for go
autocmd BufRead,BufNewFile   *.py set tw=130
autocmd BufRead,BufNewFile   *.go set tw=130


" Wrap the line when it exceeds the max width.
" set wrap


" Highlight search matches.
:set hlsearch


" Make diff split vertical
set diffopt=vertical


" Make the new vertical open on the right side
set splitright


" Open/ Tab For Each Buffer
" set switchbuf=newtab


" Hide the numbers of inactive window, when splitting.
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set number
    autocmd WinEnter *.py set colorcolumn=131
    autocmd WinLeave *.py set colorcolumn=0
augroup END
doautocmd BgHighlight WinEnter -


" Highlighs trailing whitespace.
highlight default link TrailingWhitespace Error
augroup filetypedetect
  autocmd WinEnter,BufNewFile,BufRead * match TrailingWhitespace /\s\+$/
augroup END
autocmd InsertEnter * match none
autocmd InsertLeave * match TrailingWhitespace /\s\+$/


" Status line configuration.
set laststatus=2 " Enables the status line at the bottom of Vim
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline+=%#TabLine#
"set statusline+=%{StatuslineGit()}
set statusline+=%#StatusLine#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#TabLine#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c


" Highlight matches when jumping to next.
nnoremap <silent> n   n:call HLNext(0.2)<cr>
nnoremap <silent> N   N:call HLNext(0.3)<cr>

" Ring the match in red...
function! HLNext (blinktime)
    highlight RedOnRed ctermfg=red ctermbg=red
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    echo matchlen
    let ring_pat = (lnum > 1 ? '\%'.(lnum-1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.\|' : '')
            \ . '\%'.lnum.'l\%>'.max([col-4,1]) .'v\%<'.col.'v.'
            \ . '\|'
            \ . '\%'.lnum.'l\%>'.max([col+matchlen-1,1]) .'v\%<'.(col+matchlen+3).'v.'
            \ . '\|'
            \ . '\%'.(lnum+1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.'
    let ring = matchadd('RedOnRed', ring_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction


" Enable omnifunc to activate auto complete for supported languages.
set omnifunc=syntaxcomplete#Complete


" Vim's popup menu doesn't select the first completion item. Also don't show
" the top bar.
set completeopt=longest,menuone


" When you type the first tab hit will complete as much as possible, the
" second tab hit will provide a list, the third and subsequent tabs will cycle
" through completion options so you can complete the file without further keys
set wildmode=longest,list,full
set wildmenu


" Enable realtime auto complete.
let g:neocomplete#enable_at_startup = 1


" Enable goimports to automatically insert import paths instead of gofmt.
let g:go_fmt_command = "goimports"


" Enable syntax-highlighting for Functions, Methods and Structs.
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1


" Show the type info (|:GoInfo|) for the word under the cursor automatically.
let g:go_auto_type_info = 1


let g:go_auto_sameids = 1


" Highlights operators such as `:=` , `==`, `-=`, etc ...By default it's
" disabled.
let g:go_highlight_operators = 1


" Format the Go Tagbar.
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

"" Syntastic check.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
"let g:syntastic_python_checkers=['python -m pylint']
"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_javascript_checkers = ['jshint']


" Change the default mapping and the default command to invoke CtrlP.
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore:
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*/bower_components/*     " bower compoentns
set wildignore+=*/node_modules/*     " Node modules
set wildignore+=*/vendor/*     " Golang vendor files
set wildignore+=*/virtualenv_run/*     " Files in virtualenv
set wildignore+=*/docker-venv/*     " Files in docker virtualenv
set wildignore+=*/playground/*     " Files in playground.


" Enable built-in fuzzy search
" set path+=**


" press F10 to open the buffer menu
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>
nnoremap <F5> :buffers<CR>:buffer<Space>


" Disable powerline
let g:powerline_loaded = 1


" Writes the content of the file automatically if you call :make.
set autowrite


" Set the tag file.
set tags=./.tags;

" Automatically paste stuff to vim.
" function! WrapForTmux(s)
"   if !exists('$TMUX')
"     return a:s
"   endif

"   let tmux_start = "\<Esc>Ptmux;"
"   let tmux_end = "\<Esc>\\"

"   return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
" endfunction

" let &t_SI .= WrapForTmux("\<Esc>[?2004h")
" let &t_EI .= WrapForTmux("\<Esc>[?2004l")

" function! XTermPasteBegin()
"   set pastetoggle=<Esc>[201~
"   set paste
"   return ""
" endfunction


" Let backspace do its job
set backspace=indent,eol,start

