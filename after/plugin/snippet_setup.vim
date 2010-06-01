

call NERDSnippetsReset()
source ~/.vim/snippets/support_functions.vim
call NERDSnippetsFromDirectory("~/.vim/snippets")

"use our html snippets for eruby and xhtml too
call NERDSnippetsFromDirectoryForFiletype('~/.vim/snippets/ruby-rails', 'ruby')
call NERDSnippetsFromDirectoryForFiletype('~/.vim/snippets/eruby-rails', 'eruby')
call NERDSnippetsFromDirectoryForFiletype('~/.vim/snippets/html', 'eruby')
call NERDSnippetsFromDirectoryForFiletype('~/.vim/snippets/cucumber', 'ruby')

