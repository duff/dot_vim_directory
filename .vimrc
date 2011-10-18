
" ---------------------------------------------------------------------------
" Pathogen initialization
" ---------------------------------------------------------------------------
filetype off
call pathogen#runtime_append_all_bundles()    " using pathogen for a bunch of plugins
filetype plugin indent on                     " load filetype plugin
" call pathogen#helptags()


" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------
set nocompatible
let mapleader = ","
set history=1000                              " lots of command line history
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
set scrolloff=2                       " keep some context when scrolling
set nowrap                            " do not wrap lines
set guifont=Monaco:h13                " nice font
set antialias                         " of course


" ----------------------------------------------------------------------------
"  Visual cues
" ----------------------------------------------------------------------------
set laststatus=2                " always show the status line
set visualbell                  " quiet
set noerrorbells                " quiet
set showcmd                     " show size of visual selection
set wildmenu                    " show possible matches for command completions using tab
set wildmode=list:longest,full  " full list using common string. Then full complete.
set number                      " show line numbers


" ----------------------------------------------------------------------------
"  NerdTree config
" ----------------------------------------------------------------------------
let NERDTreeWinSize=31                " how wide nerdtree ought to be


" ----------------------------------------------------------------------------
"  Tabs
" ----------------------------------------------------------------------------
set tabstop=4
set softtabstop=2          " yep, two
set shiftwidth=2
set nosmarttab             " no tabs, thanks.
set autoindent             " automatically indent new lines
set expandtab              " expand tabs to spaces


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

" ----------------------------------------------------------------------------
"  Searching
" ----------------------------------------------------------------------------
nnoremap / /\v
vnoremap / /\v
set ignorecase              " make searches case insensitive
set smartcase               " care about case sensitivity if there's a capital letter
set incsearch               " do incremental searching
set nohlsearch              " don't highlight searches


" ---------------------------------------------------------------------------
" Mappings
" ---------------------------------------------------------------------------

" show/hide nerdtree
nnoremap <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" highlight the current buffer in the nerdtree
nnoremap <leader>n :NERDTreeFind<CR>

" navigating search results
nnoremap <leader>1 :cprevious <CR>
nnoremap <leader>2 :cnext <CR>

" turn off search highlighting
nnoremap <leader>z :noh<cr>

" space is much easier to press than %
map <space> %

" clean up cucumber tables
nnoremap <leader>= :Tabularize /\|<CR>

" move between windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" resize windows
nmap <C-Left> <C-W><<C-W><
nmap <C-Right> <C-W>><C-W>>
nmap <C-Up> <C-W>+<C-W>+
nmap <C-Down> <C-W>-<C-W>-

" method navigation
map <leader>J ]m
map <leader>j ]M
map <leader>k [m
map <leader>K [M

" command-t plugin
silent! nmap <unique> <silent> <Leader>f :CommandT<CR>
nnoremap <leader>F :CommandTFlush<CR>:CommandT<CR>
set wildignore+=vendor/plugins/**,vendor/ruby/**,vendor/gems/**,vendor/cache/**,vendor/rails/**,coverage/**,tmp/**

" ack shortcuts
nnoremap <leader>A :Ack<cword><CR>
nnoremap <leader>a :Ack<space>
vmap <leader>A "ry:Ack<space>"<C-r>r"<CR>

" normal mode shortcuts
nmap <leader><Enter> [<space>
nnoremap <leader><space> i<space><Esc>
noremap L $

" switch between a symbol and a string
nmap <leader>: ds"i:<Esc>e
nmap <leader>" csw"hxl

" ctags shortcuts
nmap <C-\> <C-]>
nmap g<C-\> g]

" easily back to normal mode
inoremap ;; <Esc>
inoremap ¬ <Esc>
inoremap jj <Esc>

" auto complete shortcut
imap <S-space> <C-n>

" hash syntax shortcut
inoremap <C-l> <space>=><space>

" allow multiple pastes of the same content when pasting in visual mode.
vnoremap p pgvy

" delete the line below/above the current cursor position
nnoremap do jddk^
nnoremap dO kdd^

" Shortcut to make splits
nnoremap <leader>s :sp<cr><C-w>j
nnoremap <leader>v :vsp<cr><C-w>l

" edit vimrc
nmap <leader>c :sp ~/.vimrc<CR><C-W>_
nmap <leader>C :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR><leader>d<leader>d<C-L>

" Remove trailing whitespace
nnoremap <leader>h :FixWhitespace<cr>

" Save a few keystrokes
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Bubble lines
nmap ˚ [e
nmap ∆ ]e
vmap ˚ [egv
vmap ∆ ]egv

" Easily replay the macro recorded in register q
nnoremap <Leader>m @q

" Hook up ctrl-i to navigate the jump list. I don't know why ctrl-i
" doesn't seem to work for me by default.
nmap <C-i> <C-tab>

" spell check
nnoremap <leader>p :setlocal spell spelllang=en_us<CR>
nnoremap <leader>P :setlocal nospell<CR>

" Better goto mark default
nnoremap ' `
nnoremap ` '

" show/hide gundo
nnoremap <leader>g :GundoToggle<CR>

nnoremap <leader>r :Rake<CR>
nnoremap <leader>R :.Rake<CR>

" ---------------------------------------------------------------------------
"  rails.vim plugin mappings
" ---------------------------------------------------------------------------

nnoremap <leader><leader>c :Rcontroller<space>
nnoremap <leader><leader>m :Rmodel<space>
nnoremap <leader><leader>a :Rmailer<space>
nnoremap <leader><leader>v :Rview<space>
nnoremap <leader><leader>h :Rhelper<space>
nnoremap <leader><leader>i :Rinitializer<space>
nnoremap <leader><leader>e :Renvironment<space>
nnoremap <leader><leader>l :Rlib<space>
nnoremap <leader><leader>f :Rfeature<space>
nnoremap <leader><leader>u :Runittest<space>
nnoremap <leader><leader>j :Rjavascript<space>
nnoremap <leader><leader>t :Rtask<space>
nnoremap <leader><leader>r :Rspec<space>
nnoremap <leader><leader>s :Rstepdefinitions<space>
nnoremap <leader><leader>d :Rmigration<space>


" ---------------------------------------------------------------------------
"  custom commands - use these at the : command prompt
" ---------------------------------------------------------------------------

" Forgot to `sudo vim`.  This saves the file anyway.
command! SudoWrite w !sudo tee %

" Reload snipmate snippets
command! SnipmateReloadSnippets call ReloadAllSnippets()


" ---------------------------------------------------------------------------
"  rails.vim autocommands
" ---------------------------------------------------------------------------
autocmd User Rails silent! Rnavcommand feature           features                  -glob=**/* -suffix=.feature
autocmd User Rails silent! Rnavcommand stepdefinitions   features/step_definitions -glob=**/* -suffix=_steps.rb


" ---------------------------------------------------------------------------
"  Status line customization
" ---------------------------------------------------------------------------
set statusline=
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position


" ---------------------------------------------------------------------------
"  Command-t customization
" ---------------------------------------------------------------------------
let g:CommandTMaxHeight=20

" ---------------------------------------------------------------------------
"  Gundo customization
" ---------------------------------------------------------------------------
let g:gundo_right=1

" ---------------------------------------------------------------------------
"  ctags-vim-johnson customization
" ---------------------------------------------------------------------------
let g:ctags_statusline=1

" ---------------------------------------------------------------------------
"  Colors/Theme
" ---------------------------------------------------------------------------
colorscheme vividchalk
syntax on
highlight LineNr guifg=#383838


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
set grepprg=ack
set grepformat=%f:%l:%m
set completeopt=longest,menu,preview        " insert mode comletion options
set complete=.
set lines=79 columns=272

" Improve navigation of the popup menu for completion.
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Yank to the * register (system clipboard) to easily paste into other apps.
set clipboard+=unnamed


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
nmap Q :QFix<CR>

augroup QFixToggle
 autocmd!
 autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
 autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END


if $TERM == 'screen'
  set term=xterm
endif

