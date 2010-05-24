
" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------

call pathogen#runtime_append_all_bundles()    " using pathogen for a bunch of plugins
set nocompatible
let mapleader = ","
set history=1000                              " lots of command line history
filetype plugin indent on                     " load filetype plugin
set viminfo='10,\"100,:20,%,n~/.viminfo       " remember certain things when we exit
set autoread                                  " reload files changed outside of Vim
set autowrite                                 " some commands should cause an automatic write

" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------
set ruler                             " show the cursor position all the time
set number                            " line numbers
set backspace=start,indent,eol        " allow backspacing over anything in insert mode
set guioptions=eg                     " disable scrollbars, etc
set wm=2                              " wrap margin on the right
let NERDTreeWinSize=31                " how wide nerdtree ought to be


" ----------------------------------------------------------------------------
"  Visual cues
" ----------------------------------------------------------------------------
set incsearch               " do incremental searching
set laststatus=2            " always show the status line
set nohlsearch              " don't highlight searches
set visualbell              " quiet
set noerrorbells            " quiet



" ----------------------------------------------------------------------------
"  Text formatting
" ----------------------------------------------------------------------------
set autoindent             " automatically indent new lines
set expandtab              " expand tabs to spaces
set nowrap                 " do not wrap lines
set softtabstop=2          " yep, two
set shiftwidth=2
set tabstop=4
set nosmarttab             " no tabs, thanks.


" ----------------------------------------------------------------------------
"  Backups
" ----------------------------------------------------------------------------

set nobackup                           " do not keep backups after close
set nowritebackup                      " do not keep a backup while working
set noswapfile                         " don't keep swp files either
set backupdir=~/.vim/backups           " store backups under ~/.vim/backup
set backupcopy=yes                     " keep attributes of original file
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/tmp               " where to keep swp files



" ---------------------------------------------------------------------------
" Mappings
" ---------------------------------------------------------------------------

" show/hide nerdtree
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>n :NERDTreeFind<CR>

" navigating search results
map <leader>1 :cprevious <CR>
map <leader>2 :cnext <CR>

" clean up cucumber tables
map <leader>= :Tabularize /\|<CR>

" move between windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" method navigation
map <leader>j ]m
map <leader>J ]M
map <leader>k [m
map <leader>K [M

" edit vimrc
map <leader>v :sp ~/.vimrc<CR><C-W>_
map <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" command-t plugin
silent! nmap <unique> <silent> <Leader>f :CommandT<CR>
map <leader>F :CommandTFlush<CR>
set wildignore+=bundler_gems,legacy_gems,coverage,images,plugins,activesupport,actionpack,railties,actionmailer

" ack shortcuts
map <leader>A :Ack<cword><CR>
map <leader>a :Ack<Space>

" normal mode shortcuts
nmap <leader><Enter> _i<Enter><Esc>
nmap <leader><Space> i<Space><Esc>

" switch between a symbol and a string
nmap <leader>: ds"i:<Esc>e
nmap <leader>" bhxcsw"

" ctags shortcuts
nmap <C-\> <C-]>
nmap g<C-\> g<C-]>

" easily back to normal mode
imap ;; <Esc>

" auto complete shortcut
imap <S-Space> <C-n>

" hash syntax shortcut
imap <C-l> <Space>=><Space>


" ---------------------------------------------------------------------------
"  rails.vim plugin mappgins
" ---------------------------------------------------------------------------
nmap <leader>r :Rake<CR>
nmap <leader>R :.Rake<CR>

nmap <leader><leader>c :Rcontroller 
nmap <leader><leader>m :Rmodel 
nmap <leader><leader>v :Rview 
nmap <leader><leader>h :Rhelper 
nmap <leader><leader>i :Rinitializer 
nmap <leader><leader>e :Renvironment 
nmap <leader><leader>l :Rlib 
nmap <leader><leader>s :Rintegrationtest 

" ---------------------------------------------------------------------------
"  Status line customization
" ---------------------------------------------------------------------------
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=\ %{fugitive#statusline()}   " fugitive
set statusline+=%=                           " right align remainder
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position


" ---------------------------------------------------------------------------
"  Command-t customization
" ---------------------------------------------------------------------------
let g:CommandTMaxHeight=20


" ---------------------------------------------------------------------------
"  Colors/Theme
" ---------------------------------------------------------------------------
colorscheme vividchalk
syntax on


" ---------------------------------------------------------------------------
"  Surround plugin - allow # to be used for string interpolation.
" ---------------------------------------------------------------------------
autocmd FileType ruby let g:surround_113 = "#{\r}"   " v
autocmd FileType ruby let g:surround_35  = "#{\r}"   " #


" ---------------------------------------------------------------------------
"  Misc stuff
" ---------------------------------------------------------------------------
set clipboard+=unnamed
set grepprg=ack
set grepformat=%f:%l:%m

inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

set completeopt=longest,menu,preview        " insert mode comletion options
set complete=.
set lines=79 columns=272

" Write all named, changed buffers when Vim loses focus
au FocusLost * :wall

augroup myfiletypes
  "clear old autocmds in group
  autocmd!    
  
  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml set ai sw=2 sts=2 et     
augroup END

augroup markdown
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:>
augroup END

let g:liquid_highlight_types=["html","erb=eruby","html+erb=eruby.html"]


" ---------------------------------------------------------------------------
"  Jump to last saved position of buffer when re-opening
" ---------------------------------------------------------------------------
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END



" ---------------------------------------------------------------------------
"  Open url on current line in browser
" ---------------------------------------------------------------------------
function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
	  exec "!open \"" . s:uri . "\""
  else
	  echo "No URI found in line."
  endif
endfunction
nmap <Leader>b :call HandleURI()<CR>


" ---------------------------------------------------------------------------
" Allow toggling of the quickfix window
" ---------------------------------------------------------------------------
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
  else
    execute "copen 15"
  endif
endfunction
nmap <Leader>q :QFix<CR>

augroup QFixToggle
 autocmd!
 autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
 autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END



" ---------------------------------------------------------------------------
"  Operate on indent levels.  Awesomeness.
" ---------------------------------------------------------------------------
onoremap <silent>ai :<C-u>cal IndTxtObj(0)<CR>
onoremap <silent>ii :<C-u>cal IndTxtObj(1)<CR>
vnoremap <silent>ai :<C-u>cal IndTxtObj(0)<CR><Esc>gv
vnoremap <silent>ii :<C-u>cal IndTxtObj(1)<CR><Esc>gv

function! IndTxtObj(inner)
  if &filetype == 'haml' || &filetype == 'sass' || &filetype == 'python'
    let meaningful_indentation = 1
  else
    let meaningful_indentation = 0
  endif
  let curline = line(".")
  let lastline = line("$")
  let i = indent(line(".")) - &shiftwidth * (v:count1 - 1)
  let i = i < 0 ? 0 : i
  if getline(".") =~ "^\\s*$"
    return
  endif
  let p = line(".") - 1
  let nextblank = getline(p) =~ "^\\s*$"
  while p > 0 && (nextblank || indent(p) >= i )
    -
    let p = line(".") - 1
    let nextblank = getline(p) =~ "^\\s*$"
  endwhile
  if (!a:inner)
    -
  endif
  normal! 0V
  call cursor(curline, 0)
  let p = line(".") + 1
  let nextblank = getline(p) =~ "^\\s*$"
  while p <= lastline && (nextblank || indent(p) >= i )
    +
    let p = line(".") + 1
    let nextblank = getline(p) =~ "^\\s*$"
  endwhile
  if (!a:inner && !meaningful_indentation)
    +
  endif
  normal! $
endfunction

