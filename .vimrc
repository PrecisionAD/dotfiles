
"Vim will detect the type of file in use"
filetype on

"Enable plugins and load them for the detected file type"
filetype plugin on

"Load and indent file for the detected file type"
filetype indent on

" set t_Co=256
syntax on

"Smart indentation"
set autoindent              "Indent"
set autoindent smartindent  "Smart indent"
set expandtab
set sw=4                    "Number of spaces after auto indent"
set softtabstop=4
set tabstop=4               "Number of spaces for tab"
set textwidth=80            "Max width of text"

"Show the numbers of lines and cursor in the file"
set number                  "Show number lines"
set cursorline              "Show current working line"
set relativenumber          "Show relative numbers from current position"

"Various options"
set title                   "Show title of file in vim header"
set incsearch               "Shows matching characters while searching"
set ignorecase              "Ignores capital letters while searching"
set smartcase               "Override ignore case if searching for capital letters"
set showmode                "Shows the mode you are currently in Vim"
set showmatch               "Matches parenthesis"
" set copyindent              "Copies last indent"
set hlsearch                "Highlights search"
set bri                     "Preserves indentation in wrapped text"
set sc
set formatoptions+=r        "Asterisk will auto appear"
set history=500             "Delete undo times"
set updatetime=250
set nocompatible            "Disable compatability with vi to avoid issues"

"Delete while in insert mode with backspace"
set backspace=indent,eol,start

"Ignores following types of files"
set wildignore=*.doc,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"Show if there are any trailing spaces that might cause issues"
set list
set listchars=tab:-.,nbsp:',trail:*,extends:>


" PLUGINS ------------------------------------------------------------------------------- {{{

call plug#begin()

"Fuzzy search of files"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Create custom snippets"
Plug 'SirVer/ultisnips'

"Syntax checker"
Plug 'dense-analysis/ale'

"Git support"
Plug 'tpope/vim-fugitive'

"Shows additions, modifications, and deletions using git"
Plug 'airblade/vim-gitgutter'

"Color coded termminal"
Plug 'vim-airline/vim-airline'

"Shows structure of members/functions"
Plug 'majutsushi/tagbar'

"SuperTab - needed so UltiSnips and YCM don't conflic because of <tab>"
Plug 'ervandew/supertab'

"Auto-Complete"
Plug 'valloric/youcompleteme'


"*** Color schemes for Vim ***"
"gruvbox"
Plug 'morhetz/gruvbox'
" everforest"
Plug 'sainnhe/everforest'
"molokai"
Plug 'tomasr/molokai'
"sonokai"
Plug 'sainnhe/sonokai'
"srcery"
Plug 'srcery-colors/srcery-vim'


call plug#end()

" }}}

"Needs to be declared here after the plugin 'gruvbox' is installed"
set background=dark
" color gruvbox
color everforest
" color molokai
" color sonokai
" color srcery

" MAPPINGS ----------------------------------------------------------------------------- {{{

"*** Saving/quitting a file ***"
"Quit the file"
inoremap <Leader>q <esc> :q <cr>
nnoremap <Leader>q :q <cr>

"Save the file"
inoremap <Leader>w <esc> :w <cr>
nnoremap <Leader>w :w <cr>

"Exit insert mode"
inoremap jj <esc>

"Insert brackets for functions, classes, etc"
inoremap {<cr> <cr>{<cr>}<esc>ko


"*** Plugin mappings ***"
"Start GDB"
nnoremap gdb :packadd termdebug <bar> :Termdebug <cr>

"See error details"
nnoremap <Leader>a :ALEDetail <cr>

"Git blame"
nnoremap gb :Git<space>blame<cr>

"Open UltiSnipsEdit"
nnoremap ue :UltiSnipsEdit!<cr> 2<cr>

"Open ripgrep in new tab to search for patterns"
nnoremap <Leader>r :tabnew <cr>:Rg!<cr>

"Open fuzzy search on a new tab"
nnoremap <Leader>z :tabnew <cr>:FZF<cr>

"Open hunk preview window"
inoremap <Leader>h <esc> :GitGutterPreviewHunk <cr>
nnoremap <Leader>h :GitGutterPreviewHunk <cr>


"*** Opening/moving/splitting tabs/files/buffers ***"
"Move tab to the left or right"
nnoremap <Leader>1 :tabm<space>-1<cr>
nnoremap <Leader>2 :tabm<space>+1<cr>

"Open a new, vertical, or horizontal new tab"
nnoremap <Leader>n :new <bar>:Files!<cr>
nnoremap <Leader>vs :vnew <bar>:Files!<cr>

"Open a vertical help window"
nnoremap <Leader>vh :vertical h<space>

"Open a new tab"
nnoremap <Leader>t :tabnew <cr>

"Close a tab"
nnoremap <Leader>c :tabclose<cr>

"Split screen vertically"
nnoremap sv :vsplit<cr> <c-w><c-w> :Ex <cr>

"Split screen horizontally"
nnoremap sh :sp<cr>

"Move a line up"
nnoremap [e :move -2 <cr>

"Move a line down"
nnoremap ]e :move +1 <cr>

"Increase width"
nnoremap <S-left> :vertical resize -1<cr>

"Decrease width"
nnoremap <S-right> :vertical resize +1<cr>

"Switch to next file from the quickfix"
nnoremap ]q :cnext<cr>

"Switch to previous file from the quickfix"
nnoremap [q :cprevious<cr>


"*** Misc ***"
"Remove trailing white spaces"
nnoremap <F5> :let _s=@/ <bar> :%s/\s\+$//e <bar> :let @/=_s <bar> <cr>

"Leader"
nnoremap <space> :


"*** Resize window ***"
nnoremap <a-right> <c-w>>
nnoremap <a-left> <c-w><
nnoremap <a-up> <c-w>+
nnoremap <a-down> <c-w>-


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


"*** These are to trigger snippets ***"
let g:UltiSnipsExapndTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<F12>"
let g:UltiSnipsJumpBackwardTrigger="<F10>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsSnippetDirectories=['UltiSnips']


"*** To properly display gdb ***"
let g:termdebug_popup = 0
let g:termdebug_wide = 163


"*** Comment blocks of code at once ***"
autocmd FileType c,cpp setlocal commentstring=//\ %s


"*** Git Gutter Customization ***"
highlight GitgutterAdd guifg=#009900 ctermfg=Green
highlight GitgutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitgutterDelete guifg=#ff2222 ctermfg=Red


"*** Make YCM compatible with UltiSnips ***"
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'


"*** Ale Customization ***"
let g:ale_virtualtext_cursor = 'current'


"*** clang-tidy Customization ***"
let g:ale_cpp_clangtidy_executable = 'clang-tidy-15'
let g:ale_cpp_clangtidy_checks = [
            \'-checks',
            \'clang-analyzer-*',
            \'cppcoreguidelines-*',
            \'concurrency-*',
            \'misc-*',
            \'modernize-*',
            \'-modernize-use-trailing-return-type',
            \'performance-*',
            \'readability-*']

" }}}




