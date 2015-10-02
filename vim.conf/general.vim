filetype plugin indent on
syntax on

" Command behaviour
set showcmd
set laststatus=2

" Text-y stuff
set backspace=indent,eol,start      " backspace everything
set shiftround                      " 'h' and 'l' will wrap around lines
set whichwrap+=<,>,h,l

" Gutter number
set relativenumber
set number
set cursorline

" Tabs
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2

" File-system
set autoread
set noswapfile
set nowritebackup

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Terminal errors
set noerrorbells
set visualbell
set t_vb=

" Key timeouts
set tm=500
set ttimeoutlen=50

" Split opening positions
set splitright
set splitbelow

" Screen scrolling behaviour
set scrolloff=10                    " keep cursor relatively centered
set sidescrolloff=10

" Showing invisible characters
set listchars=tab:›\ ,eol:¬,trail:⋅ " textmate
set list

" Command tab-completion
set wildmenu                        " command auto-completion
set wildmode=list:longest,full

" Misc
set ttyfast                         " probably already set but /shruggie
set encoding=utf-8
set complete+=kspell
set hidden"