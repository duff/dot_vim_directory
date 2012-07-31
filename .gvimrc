set lines=79 columns=272

set guioptions=eg         " disable scrollbars, etc
set number                " show line numbers

set guifont=Monaco:h11    " nice font
" set guifont=Bitstream\ Vera\ Sans\ Mono:h12


set background=dark
colorscheme solarized
highlight Normal guibg=Black
highlight RubyDefine guibg=Black
highlight LineNr guibg=#1c1c1c

" Don't need to see the ~ symbols where there's no text.  It's noise.
highlight NonText guibg=Black guifg=Black

