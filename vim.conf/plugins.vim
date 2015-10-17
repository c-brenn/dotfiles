" -----------------------
" Vim Plug
" -----------------------
call plug#begin('~/.vim/plugged')

" -- GIT --
"    -- Gutter
Plug 'airblade/vim-gitgutter'
"    -- Git in Vim
Plug 'tpope/vim-fugitive'

" -- COMPLETION --
"    -- Auto Completion
Plug 'ajh17/VimCompletesMe'
"    -- Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"    -- Pair thingies
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'

" -- MAGICAL SEARCH --
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  }

" -- SYNTAX --
Plug 'scrooloose/syntastic'
"    -- languages
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'dag/vim2hs'
"    -- Frameworks
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'

" -- COLOURS --
Plug 'chriskempson/base16-vim'

" -- MISC --
"    -- Status Bar
Plug 'bling/vim-airline'
"    -- Yum, salad
Plug 'tpope/vim-vinegar'
"    -- Moving Between Buffers
Plug 'troydm/easybuffer.vim'
"    -- Alignment
Plug 'godlygeek/tabular'
call plug#end()

