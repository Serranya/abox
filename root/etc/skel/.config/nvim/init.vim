set nocompatible
syntax enable
set number                               " enable line numbers
set encoding=utf-8
set showcmd                              " show incomplete commands
filetype plugin indent on                " load file type plugins + indentation
set digraph                              " Enable the input via {char1}<BS>{char2} e.g.(L<BS>Z for ◊)
set hidden                               " Allow to hide changed buffers
set signcolumn=yes                       " Always show signcolumn
let mapleader = " "

"" netrw
let g:netrw_liststyle=3                  " Browse netrw as tree
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

" Style
set termguicolors                        " 24-bit RGB color support

"" Use ripgrep if available
if executable('rg')
	set grepprg=rg\ --color=never         " Use ripgrep if available
endif
