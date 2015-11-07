" -----------------------
" Vim Plug
" -----------------------
call plug#begin('~/.vim/plugged')

if executable('tmux')
  " -- TMUX --
  "  -- Tmux within VIM :sparkles:
  Plug 'benmills/vimux'
  "  -- VIMUX --
    " -- Ruby tests for vimux
    Plug 'pgr0ss/vimux-ruby-test'
endif
" -- GIT --
"   -- Gutter
    Plug 'airblade/vim-gitgutter'
"    -- Git in Vim
    Plug 'tpope/vim-fugitive'

" -- COMPLETION --
"   -- Auto Completion
    Plug 'ervandew/supertab'
"    -- Snippets
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"   -- Pair thingies
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-endwise'
"   -- Comment thingies
    Plug 'tpope/vim-commentary'
"   -- Surround thingies
    Plug 'tpope/vim-surround'

" -- MAGICAL SEARCH --
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  }

" -- SYNTAX --
Plug 'scrooloose/syntastic'
"   -- languages
    Plug 'vim-ruby/vim-ruby'
    Plug 'pangloss/vim-javascript'
    Plug 'cakebaker/scss-syntax.vim'
"   -- Frameworks
    Plug 'tpope/vim-rails'
    Plug 'tpope/vim-bundler'

" -- NAVIGATION --
"   -- Paired bindings
    Plug 'tpope/vim-unimpaired'

" -- COLOURS --
"   -- Colour Schemes
    Plug 'chriskempson/base16-vim'

" -- TEXT OBJECTS --
"   -- Bless Kana
    Plug 'kana/vim-textobj-user'
"   -- Entire file
    Plug 'kana/vim-textobj-entire'

" -- MISC --
"   -- Statusline
    Plug 'bling/vim-airline'
"   -- IRB in Vim
    Plug 't9md/vim-ruby-xmpfilter'
"   -- Yum, salad
    Plug 'tpope/vim-vinegar'
"   -- Moving Between Buffers
    Plug 'troydm/easybuffer.vim'
"   -- Alignment
    Plug 'godlygeek/tabular'
call plug#end()

