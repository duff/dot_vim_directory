
" ---------------------------------------------------------------------------
" Pathogen initialization
" ---------------------------------------------------------------------------
filetype off
call pathogen#runtime_append_all_bundles()    " using pathogen for a bunch of plugins
filetype plugin indent on                     " load filetype plugin
call pathogen#helptags()


" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------
set nocompatible
let mapleader = ","
set history=1000                              " lots of command line history
set viminfo='10,\"100,:20,%,n~/.viminfo       " remember certain things when we exit
set autoread                                  " reload files changed outside of Vim
set autowrite                                 " some commands should cause an automatic write
set nrformats=                                " improves incrementing when there are leading 0's.
set cpo+=J                                    " sentences are followed by 2 spaces.
set linebreak                                 " wrapping preserves words.

" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------
set ruler                             " show the cursor position all the time
set backspace=start,indent,eol        " allow backspacing over anything in insert mode
set wm=2                              " wrap margin on the right
set scrolloff=2                       " keep some context when scrolling
set nowrap                            " do not wrap lines
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


" ----------------------------------------------------------------------------
"  NerdTree config
" ----------------------------------------------------------------------------
let NERDTreeWinSize=31                " how wide nerdtree ought to be
let NERDTreeMinimalUI=1               " don't need to the noise
let NERDTreeDirArrows=1               " prettier arrows


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

" make it easy to move to adjacent files in the dir
nmap gj :NERDTreeFind<CR><C-j><Enter>
nmap gk :NERDTreeFind<CR><C-k><Enter>

" navigating search results
nnoremap <leader>1 :cprevious <CR>
nnoremap <leader>2 :cnext <CR>

" space is much easier to press than %
map <space> %

" clean up cucumber tables
nnoremap <leader>= :Tabularize /\|<CR>

" move between windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" resize windows
nmap <C-Left> <C-W><<C-W><
nmap <C-Right> <C-W>><C-W>>
nmap <C-Up> <C-W>+<C-W>+
nmap <C-Down> <C-W>-<C-W>-

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" add the dir of the current file to the command
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" command-t plugin
" silent! nmap <unique> <silent> <Leader>f :CommandT<CR>
" nnoremap <leader>F :CommandTFlush<CR>:CommandT<CR>

" ctrlp plugin
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>F :CtrlPClearCache<CR>:CtrlP<CR>

set wildignore+=vendor/plugins/**,vendor/ruby/**,vendor/gems/**,vendor/cache/**,vendor/rails/**,public/assets/**,vendor/assets/javascripts/**,coverage/**,tmp/**

" ack shortcuts
nnoremap <leader>A :Ack<cword><CR>
nnoremap <leader>a :Ack<space>
vmap <leader>A "ry:Ack<space>"<C-r>r"<CR>

" normal mode shortcuts
nmap <leader><Enter> [<space>
nnoremap <leader><space> i<space><Esc>

" Easier to get to the end of the line
noremap gl g_

" Easier to get to the first non-blank character of the line
noremap gh ^

" ctags shortcuts
nmap <C-\> <C-]>
nmap g<C-\> g]

" easily back to normal mode
inoremap ;; <Esc>
inoremap ¬ <Esc>
inoremap jj <Esc>

" auto complete shortcut
imap <S-space> <C-n>

" switch it up with the switch plugin
nnoremap <S-space> :Switch<CR>

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
nmap <leader>C :source $MYVIMRC<CR>:source $MYGVIMRC<CR>:filetype detect<CR><leader>d<leader>d<C-L>:exe ":echo 'vimrc reloaded'"<CR>

" Shortcut to easily edit a mail message.
nnoremap <leader>e :sp /tmp/duff_mail.mail<CR><C-W>_

" Remove trailing whitespace
nnoremap <leader>h :FixWhitespace<cr>

" Save a few keystrokes
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>

" I often use a Scratch buffer
nnoremap <leader>S :Scratch<CR>

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

" toggle spell check
nnoremap <leader>p :set spell! spell?<cr>

" toggle word wrap
nnoremap <leader>r :set wrap! wrap?<cr>

" Better goto mark default
nnoremap ' `
nnoremap ` '

" switch between the last 2 files
nnoremap go <c-^>

" switch to a 1.9 hash
nnoremap <leader>y F:xea:<esc>llxxx

" some rails helpers
nnoremap <leader>k :Rake<CR>
nnoremap <leader>K :.Rake<CR>
map <silent> <C-N> :se invhlsearch<CR>

" start a :%s with the visual selection.
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>


" toggle relative line number
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <leader>u :call NumberToggle()<cr>


" ---------------------------------------------------------------------------
"  primary rails navigation
" ---------------------------------------------------------------------------
nnoremap <leader><leader>m :CtrlP app/models<cr>
nnoremap <leader><leader>v :CtrlP app/views<cr>
nnoremap <leader><leader>c :CtrlP app/controllers<cr>
nnoremap <leader><leader>h :CtrlP app/helpers<cr>
nnoremap <leader><leader>l :CtrlP lib<cr>
nnoremap <leader><leader>f :CtrlP features<cr>
nnoremap <leader><leader>u :CtrlP test<cr>
nnoremap <leader><leader>r :CtrlP spec<cr>
nnoremap <leader><leader>o :CtrlP doc<cr>
nnoremap <leader><leader>p :CtrlP app/presenters<cr>
nnoremap <leader><leader>j :CtrlP app/assets/javascripts<cr>
nnoremap <leader><leader>s :CtrlP app/assets/stylesheets<cr>

nnoremap <leader><leader>i :Einitializer<space>
nnoremap <leader><leader>e :Eenvironment<space>
nnoremap <leader><leader>t :Etask<space>
nnoremap <leader><leader>d :Emigration<space>

nnoremap <leader><leader>g :e Gemfile<cr>


" ---------------------------------------------------------------------------
"  other navigation
" ---------------------------------------------------------------------------

" Command-T of the directory of the current file
" nmap <leader>gf :CommandT %%<cr>

" For source of octopress project
nnoremap <leader>gs :CtrlP source<cr>




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
"  CtrlP customization
" ---------------------------------------------------------------------------
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:ctrlp_switch_buffer = 'E'
" let g:ctrlp_by_filename = 1
let g:ctrlp_prompt_mappings = {
    \ 'PrtClearCache()':      ['<c-c>'],
    \ 'PrtExit()':            ['<esc>', '<c-g>'],
    \ }


" ---------------------------------------------------------------------------
"  Command-t customization
" ---------------------------------------------------------------------------
" let g:CommandTMaxHeight=20

" ---------------------------------------------------------------------------
"  Gundo customization
" ---------------------------------------------------------------------------
let g:gundo_right=1

" ---------------------------------------------------------------------------
"  ctags-vim-johnson customization
" ---------------------------------------------------------------------------
let g:ctags_statusline=1

" ---------------------------------------------------------------------------
"  Notes plugin customization
" ---------------------------------------------------------------------------
let g:notes_directories = [ '~/Documents/Notes' ]
let g:notes_suffix = '.txt'

" ---------------------------------------------------------------------------
"  Colors/Theme
" ---------------------------------------------------------------------------
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
"  Use The Silver Searcher for everything
" ---------------------------------------------------------------------------
let g:ackprg = 'ag --nogroup --column'
set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'


" ---------------------------------------------------------------------------
"  Misc stuff
" ---------------------------------------------------------------------------
" set grepformat=%f:%l:%m
set completeopt=longest,menu,preview        " insert mode comletion options
set complete=.


" Improve navigation of the popup menu for completion.
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Yank to the * register (system clipboard) to easily paste into other apps.
set clipboard+=unnamed

" Make mail files behave appropriately
au BufRead,BufNewFile *.mail set filetype=mail spell spelllang=en_us textwidth=67

augroup myfiletypes
  "clear old autocmds in group
  autocmd!

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml set ai sw=2 sts=2 et

  autocmd FileType gitcommit setlocal spell
augroup END

augroup markdown
  autocmd BufRead *.markdown setlocal spell ai formatoptions=tcroqn2 comments=n:>
augroup END

let g:liquid_highlight_types=["html","erb=eruby","html+erb=eruby.html"]


" ---------------------------------------------------------------------------
"  Jump to last saved position of buffer when re-opening
" ---------------------------------------------------------------------------
autocmd BufReadPost *
  \ if !(bufname("%") =~ '\(COMMIT_EDITMSG\)') && line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


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


