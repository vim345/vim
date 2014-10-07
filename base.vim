" Automaticall load changes made to vimrc.
autocmd! bufwritepost .vimrc source %


" Pathogen call
call pathogen#infect()


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


" Set the width to 80 for Python and 100 for go
autocmd BufRead,BufNewFile   *.py set tw=80
autocmd BufRead,BufNewFile   *.go set tw=100


" Wrap the line when it exceeds the max width.
" set wrap


" Highlight search matches.
:set hlsearch


" Make diff split vertical
set diffopt=vertical


" Make the new vertical open on the right side
set splitright


" Open/ Tab For Each Buffer
:set switchbuf=newtab


" Hide the numbers of inactive window, when splitting.
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set number
    autocmd WinLeave * set nonumber
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
    autocmd WinEnter * set colorcolumn=81
    autocmd WinLeave * set colorcolumn=0
augroup END
doautocmd BgHighlight WinEnter -


" Highlighs trailing whitespace.
highlight default link TrailingWhitespace Error
augroup filetypedetect
  autocmd WinEnter,BufNewFile,BufRead * match TrailingWhitespace /\s\+$/
augroup END
autocmd InsertEnter * match none
autocmd InsertLeave * match TrailingWhitespace /\s\+$/


" Show current git branch.
set laststatus=2 " Enables the status line at the bottom of Vim
set statusline=%#StatusLineNC#\ Git\ %#ErrorMsg#\ %{GitBranchInfoTokens()[0]}\ %#StatusLine#\ %f\ %h%m%r%=%k[%{(&fenc\ ==\\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}][U+%04B]\ %-12.(%l,%#ErrorMsg#\%c%V%)\%#StatusLine#\%P


" Highlight matches when jumping to next.
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(1.4)<cr>

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

