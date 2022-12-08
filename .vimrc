"Disable compatability with vi to avoid issues"
set nocompatible 

"Vim will detect the type of file in use"
filetype on

"Enable plugins and load them for the detected file type"
filetype plugin on

"Load and indent file for the detected file type"
filetype indent on

"Set t-co=256"
syntax on

"Smart indentation"
set autoindent              "Indent"
set autoindent smartindent  "Smart indent"
set expandtab
set sw=2                    "Number of spaces after auto indent"
set softtabstop=2
set tabstop=2               "Number of spaces for tab"

"Show the numbers of lines and cursor in the file"
set number                  "Show number lines"
set cursorline              "Show current working line"
set relativenumber

"Various options"
set title                   "Show title of file in vim header"
set incsearch               "Shows matching characters while searching"
set ignorecase              "Ignores capital letters while searching"
set smartcase               "Override ignore case if searching for capital letters"
set showmode                "Shows the mode you are currently in Vim"
set showmatch               "Matches parenthesis"
set copyindent              "Copies last indent"
set hlsearch                "Highlights search"
set bri                     "Preserves indentation in wrapped text"
set sc
set formatoptions+=r        "Asterisk will auto appear"
set history=500             "Delete undo times"

"Ignores these types of files"
set wildignore=*.doc,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"Show if there are any trailing spaces that might cause issues"
set list
set listchars=tab:-.,nbsp:',trail:*,extends:>


" PLUGINS ------------------------------------------------------------------------------- {{{

call plug#begin()

"Fuzzy search of files"
"Plug 'junegunn/fzf'. { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"Create custom snippets"
Plug 'SirVer/ultisnips'

"Syntax checker"
Plug 'dense-analysis/ale'

"Git support"
Plug 'tpope/vim-fugitive'

"Color coded termminal"
Plug 'vim-airline/vim-airline'

"Color scheme for Vim"
Plug 'morhetz/gruvbox'

"Ripgrep"
Plug 'BurntSushi/ripgrep'


call plug#end()

" }}}

"Needs to be declared here after the plugin 'gruvbox' is installed"
set background=dark
color gruvbox               "Other option is slate"

" MAPPINGS ----------------------------------------------------------------------------- {{{

"***Everything about editing a file***"
"Quit the file"
inoremap <Leader>q <esc> :q <cr>

"Save the file"
inoremap <Leader>w <esc> :w <cr>

"Exit insert mode"
inoremap jj <esc>

"Insert brackets for functions, classes, etc"
inoremap {<cr> <cr>{<cr>}<esc>ko

"Start GDB"
nnoremap gdb :packadd termdebug <bar> :Termdebug <cr>

"See error details"
nnoremap <Leader>a :ALEDetail <cr>

"Switch to next file from the quickfix"
nnoremap ]q :cnext<cr>
"
"Switch to previous file from the quickfix"
nnoremap [q :cprevious<cr>

"Space"
nnoremap <space> :


"***Interacting with tabs/files***"
"Git blame"
nnoremap gb :Git<space>blame<cr>

"Split screen vertically"
nnoremap sv :vsplit<cr> <c-w><c-w> :Ex <cr>
"
"Split screen horizontally"
nnoremap sh :sp<cr>

"Move tab to the left or right"
nnoremap <Leader>1 :tabm<space>-1<cr>
nnoremap <Leader>2 :tabm<space>+1<cr>

"Move a line up"
nnoremap [e :move -2 <cr>

"Move a line down"
nnoremap ]e :move +1

"Open a new, vertical, or horizontal new tab"
nnoremap <Leader>n :new <cr>
nnoremap <Leader>vs :vnew <cr>
nnoremap <Leader>x :Ex <cr>

"Open ripgrep in new tab to search for patterns. kf = keyword finder"
nnoremap <Leader>r :tabnew <cr>:Rg!<cr>

"Open fuzzy search on a new tab"
nnoremap <Leader>z :tabnew <cr>:FZF!<cr>

"Open a new tab"
nnoremap <Leader>t :tabnew <cr>

"Close a tab"
nnoremap <Leader>c :tabclose<cr>

"Save file"
nnoremap <Leader>w :w <cr>

"Quit the file"
nnoremap <Leader>q :q <cr>

"Leader"
nnoremap <space> :



"***Map to open UltiSnipsEdit***"
nnoremap ue :UltiSnipsEdit!<cr> 2<cr>

" }}}


" VIMSCRIPT ----------------------------------------------------------------------------- {{{

"This enables code folding"
augroup filetype_vim
    autocmd!
    autocmd Filetype vim setlocal foldmethod=marker
augroup END

" }}}


" STATUS LINE --------------------------------------------------------------------------- {{{


" }}}


" MISC ---------------------------------------------------------------------------------- {{{
  
"Plugins need to be added to runtime path before helptags can be generated"
packloadall

"Load all of the helptags now, after plugins have been loaded. All messages and"
"errors will be ignored."
silent! helptags ALL

"These are to trigger snippets"
let g:UltiSnipsExapndTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<F12>"
let g:UltiSnipsJumpBackwardTrigger="<F10>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsSnippetDirectories=['UltiSnips']

"To display gdb"
let g:termdebug_popup = 0
let g:termdebug_wide = 163
" }}}

"color slate                  "Current color scheme for vim""



