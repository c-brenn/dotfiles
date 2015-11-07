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
set nonumber
set relativenumber
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
set listchars=tab:›\ ,trail:⋅ " textmate
set list

" Command tab-completion
set wildmenu                        " command auto-completion
set wildmode=list:longest,full

" Misc
set ttyfast
set encoding=utf-8
set complete+=kspell
set hidden"
set diffopt+=vertical

augroup FileTypeSettings
  autocmd!
  autocmd FileType html setlocal ts=2 sw=2 expandtab
  autocmd FileType ruby setlocal ts=2 sw=2 expandtab
  autocmd FileType vim setlocal ts=2 sw=2 expandtab keywordprg=:help
  autocmd FileType haskell setlocal ts=2 sw=2 expandtab
  autocmd FileType python setlocal ts=4 sw=4 expandtab
  autocmd FileType rust setlocal ts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=2 sw=2 expandtab
  autocmd FileType coffee setlocal ts=2 sw=2 expandtab
  autocmd FileType sh,zsh setlocal ts=2 sw=2 expandtab
  autocmd FileType go setlocal ts=2 sw=2 noexpandtab
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.css set filetype=scss
  autocmd FileType markdown setlocal spell textwidth=72
  autocmd Filetype gitcommit setlocal spell textwidth=72
  autocmd FileType text setlocal spell
augroup END

