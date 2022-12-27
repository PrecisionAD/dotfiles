"Some useful functions for vim"
syntax on

"Disable compatability with vi to avoid issues"
set nocompatible

"Vim will detect the type of file"
filetype on

"Enable plugins and load them for the detectec file type"
filetype plugin on

"Load and indent file for the dectected file type"
filetype indent on

"Needs to be declared after the plugin after 'gruvbox' or it won't work"
set background=dark
set t_Co=256

"Smart indentation"
set si
set autoindent        "Auto indent"
set expandtab
set sw=2              "Number of spaces after the autoindent"
set tabstop=2         "Number of spaces with each tab"
set softtabstop=2

"Show line numbers and cursor line"
set number
set cursorline

"Various options"
set title             "Show file title on vim header file"
set incsearch         "Highlighs matching characters during search"
set ignorecase        "Ignore capital letter during search"
set smartcase         "Override ignore case if searching for capital letters"
set showmode          "Show the mode you are in VIM"
set showmatch         "Show matching words/parenthesis during a search"
set hlsearch          "Highlights the search word"
set formatoptions+=r
"set copyindent       "Copies last indent"
set shortmess+=I
set history=500


"Ignore these types of files"
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv*,.img,*.xlsx

"Show tabs, trailing spaces, etc"
set listchars=tab:-.,nbsp:',trail:~
set list

" PLUGINS ------------------------------------------------------------ {{{

call plug#begin()

"Fuzzy search of files"
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"Create custom snippets"
"Plug 'SirVer/ultisnips'

"Syntax checker"
Plug 'dense-analysis/ale'

"Git support"
Plug 'tpope/vim-fugitive'

"Color coded terminal"
Plug 'vim-airline/vim-airline'

"Color-scheme for VIM"
Plug 'morhetz/gruvbox'

call plug#end()

"   }}}

color gruvbox

" MAPPINGS ------------------------------------------------------------ {{{

"Save and quit the file"
inoremap ;; <esc> :q <cr>

"Exit insert mode"
inoremap jj <esc>

"Save the file only"
inoremap <leader>w <esc> :w <cr>

"Insert matching brackets"
inoremap {<cr> <cr>{<cr>}<esc>ko

"Go to the next file in the quick-fix"
nnoremap [[ :cnext<cr>

"Go to the previous file in the quick-fix"
nnoremap ]] :cprevious<cr>

"Maybe not needed"
nnoremap <space> :

"Leader key"
nnoremap <leader> \

"Git blame"
nnoremap gb :Git<space>blame<cr>

"Split screen vertically"
nnoremap sv :vsplit<cr>

"Split screen horizontally"
nnoremap sh :sp<cr>

"Move a tab to the left"
nnoremap <leader>1 :tabm<space>-1

"Move a tab to the right"
nnoremap <leader>2 :tabm<space>+1

"Open a new tab"
nnoremap tn :tabnew<cr>

"Open ripgrep in new tab to search"
nnoremap <leader>r :tabnew <cr>:Rg!<cr>

"Open fuzzy search"
nnoremap <leader>z :tabnew <cr>:FZF!<cr>

"Closes a tab"
nnoremap cnt :tabclose<cr>

"Saves file only"
nnoremap <leader>w <esc> :w <cr>

"Exit file"
nnoremap <leader>q <esc> :q <cr>

"Temp"
nnoremap ;; <esc>:q<cr>

"   }}}

" VIMSCRIPT ------------------------------------------------------------ {{{

"This will enable code folding.
"Use the marker method of folding.
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

"   }}}

" MISC ------------------------------------------------------------ {{{

"Plugins need to be added to runtimepath before helptags can be generated.
packloadall

"Load all the tags now, errors and messages will be ignored.
silent! helptags ALL

"These are for snippets"
let g:UltiSnipsExapndTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<F12>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDir='~/.vim/UltiSnips'
let g:UltiSnipsSnippetDirectories=['UltiSnips']

"   }}}
