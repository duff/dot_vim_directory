set lines=79 columns=272

set guioptions=eg         " disable scrollbars, etc
set number                " show line numbers

" set guifont=Monaco:h11    " nice font
" set guifont=Inconsolata:h13    " nice font
set guifont=Inconsolata-dz:h11    " nice font
" set guifont=Bitstream\ Vera\ Sans\ Mono:h12


set background=dark
colorscheme solarized

highlight Normal guibg=Black
" highlight Normal guibg=#161719

highlight RubyDefine guibg=Black
highlight LineNr guibg=#1c1c1c
highlight StatusLine term=bold,reverse cterm=bold,reverse ctermfg=Gray  gui=bold,reverse guifg=Gray

highlight MatchParen guibg=NavyBlue guifg=Black

" Don't need to see the ~ symbols where there's no text.  It's noise.
highlight NonText guibg=Black guifg=Black

set colorcolumn=100             " show a faint line for column width warning
highlight ColorColumn guibg=#141400

set guicursor+=a:blinkon0
