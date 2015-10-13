" -----------------------
" Vim Plug
" -----------------------
call plug#begin('~/.vim/plugged')
" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Status Bar
Plug 'bling/vim-airline'

" Yum, salad
Plug 'tpope/vim-vinegar'

" Pair thingies
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'

" Moving Between Buffers
Plug 'troydm/easybuffer.vim'

" Wizard Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Alignment
Plug 'godlygeek/tabular'

" Magical Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  }

" Wizard Completion
Plug 'Valloric/YouCompleteMe'

" -- Languages --
Plug 'scrooloose/syntastic'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'othree/html5.vim'
Plug 'dag/vim2hs'

" -- Frameworks --
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
call plug#end()

