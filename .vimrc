 
" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------

call pathogen#helptags()
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
set backspace=start,indent,eol        " allow backspacing over anything in insert mode
set guioptions=eg                     " disable scrollbars, etc
set wm=2                              " wrap margin on the right
let NERDTreeWinSize=31                " how wide nerdtree ought to be
set guifont=Monaco:h13
set antialias

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
nnoremap <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
nnoremap <leader>n :NERDTreeFind<CR>

" navigating search results
nnoremap <leader>1 :cprevious <CR>
nnoremap <leader>2 :cnext <CR>

" space is much easier to press than %
nnoremap <space> %
vnoremap <space> %

" clean up cucumber tables
nnoremap <leader>= :Tabularize /\|<CR>

" move between windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" method navigation
nnoremap <leader>j ]m
nnoremap <leader>J ]M
nnoremap <leader>k [m
nnoremap <leader>K [M

" edit vimrc
nmap <leader>v :sp ~/.vimrc<CR><C-W>_
nmap <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR><leader>d<leader>d<C-L>

" command-t plugin
silent! nmap <unique> <silent> <Leader>f :CommandT<CR>
nnoremap <leader>F :CommandTFlush<CR>
set wildignore+=vendor/plugins/**,vendor/linked_gems/**,vendor/gems/**,vendor/rails/**,coverage/**

" ack shortcuts
nnoremap <leader>A :Ack<cword><CR>
nnoremap <leader>a :Ack<Space>

" normal mode shortcuts
nnoremap <leader><Enter> _i<Enter><Esc>
nnoremap <leader><Space> i<Space><Esc>

" switch between a symbol and a string
nnoremap <leader>: ds"i:<Esc>e
nnoremap <leader>" bhxcsw"

" ctags shortcuts
nnoremap <C-\> <C-]>
nnoremap g<C-\> g]

" easily back to normal mode
inoremap ;; <Esc>
inoremap ¬ <Esc>

" auto complete shortcut
inoremap <S-Space> <C-n>

" hash syntax shortcut
inoremap <C-l> <Space>=><Space>

" paste the last thing really yanked rather than deleted.  Useful for 
" repeatedly replacing some text with something previously yanked.
vnoremap <leader>p "0p
vnoremap <leader>P "0P

" delete the line below/above the current cursor position
nnoremap do jdd
nnoremap dO kdd

" the shift key is now optional to get into command line mode
nnoremap ; :

" ---------------------------------------------------------------------------
"  rails.vim plugin mappings
" ---------------------------------------------------------------------------
nnoremap <leader>r :Rake<CR>
nnoremap <leader>R :.Rake<CR>

nnoremap <leader><leader>c :Rcontroller 
nnoremap <leader><leader>m :Rmodel 
nnoremap <leader><leader>v :Rview 
nnoremap <leader><leader>h :Rhelper 
nnoremap <leader><leader>i :Rinitializer 
nnoremap <leader><leader>e :Renvironment 
nnoremap <leader><leader>l :Rlib 
nnoremap <leader><leader>f :Rfeature 
nnoremap <leader><leader>u :Runittest 
nnoremap <leader><leader>j :Rjavascript 
nnoremap <leader><leader>t :Rtask 
nnoremap <leader><leader>r :Rspec 


" ---------------------------------------------------------------------------
"  rails.vim autocommands
" ---------------------------------------------------------------------------
autocmd User Rails silent! Rnavcommand feature features                  -glob=* -suffix=.feature
autocmd User Rails silent! Rnavcommand steps   features/step_definitions -glob=* -suffix=_steps.rb


" ---------------------------------------------------------------------------
"  Status line customization
" ---------------------------------------------------------------------------
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set number                                   " show line numbers
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
" persistent undo
" ---------------------------------------------------------------------------
if v:version >= 703    " Only available in Vim 7.3 or greater
  set undofile
  set undodir=~/.vim/.undo
endif

" ---------------------------------------------------------------------------
"  Buffers
" ---------------------------------------------------------------------------
set hidden                                    " Let me leave buffers even when they're changed.

" Write all named, changed buffers when Vim loses focus
au FocusLost * :wall


" ---------------------------------------------------------------------------
"  omnicomplete
" ---------------------------------------------------------------------------
set ofu=syntaxcomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags


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


if $TERM == 'screen'
  set term=xterm
endif

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

