set nocompatible
syntax enable
set number                               " enable line numbers
set encoding=utf-8
set showcmd                              " show incomplete commands
filetype plugin indent on                " load file type plugins + indentation
set digraph                              " Enable the input via {char1}<BS>{char2} e.g.(L<BS>Z for ◊)

"" Whitespaces
set wrap                                 " don't wrap lines
set tabstop=3 softtabstop=3 shiftwidth=3 " length of tabs
set breakindent                          " indent correct while wrapping
set noexpandtab                          " use tabs instead of spaces
set list                                 " show invisible chars
set listchars=tab:▸\                     " use ▸ for tabs hide the rest
set backspace=indent,eol,start           " backspace through everything in insert mode

"" Searching
set hlsearch                             " highlight searcher
set incsearch                            " incremental searching
set ignorecase                           " search is case insensitive...
set smartcase                            " ... unless you use at least one capital letter

"" Vala specific
let vala_comment_strings = 1             " Enable comment strings
let vala_space_errors = 1                " Highlight space errors
