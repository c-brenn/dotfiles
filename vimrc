set nocompatible
filetype off
runtime macros/matchit.vim

" -----------------------
" Vim Plug
" -----------------------
call plug#begin('~/.vim/plugged')
if executable('tmux')
  " -- TMUX --
  Plug 'benmills/vimux'
endif
" -- GIT --
"   -- Gutter
Plug 'airblade/vim-gitgutter'
"    -- Git in Vim
  Plug 'tpope/vim-fugitive'
" -- Tests --
"    -- Rspec
  Plug 'thoughtbot/vim-rspec'
  Plug 'tpope/vim-dispatch'

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
Plug 'tpope/vim-unimpaired'

" -- COLOURS --
Plug 'chriskempson/base16-vim'

" -- TEXT OBJECTS --
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'

" -- MISC --
Plug 'bling/vim-airline'
Plug 'tpope/vim-vinegar'
Plug 'troydm/easybuffer.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-sensible'
call plug#end()

" -----------------------
" KEY BINDINGS
" -----------------------

let mapleader = ' '
let g:mapleader = ' '

nnoremap <leader>R :so ~/.vimrc<CR>

nnoremap <silent> <C-p> :FZF<CR>

nnoremap <Leader>tw :call TrimWhitespace()<CR>
au BufWritePre *.rb :%s/\s\+$//e

let g:rspec_command = "Dispatch bundle exec rspec {spec} --format progress"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>d :Dispatch<CR>

function! TrimWhitespace()
  %s/\s\+$//e
endfunc

" -----------------------
"  GENERAL
" -----------------------
set relativenumber
set hidden
set scrolloff=10
set sidescrolloff=10"
set t_Co=256
set backupdir=~/.tmp
set directory=~/.tmp

" -----------------------
" SYNTASTIC
" -----------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers=['']
let g:syntastic_disabled_filetype = ['html']

" -----------------------
" COLOURS
" -----------------------

let base16colorspace=256
set background=dark
colorscheme base16-solarized

" -----------------------
" AIRLINE
" -----------------------

let g:solarized_termcolors=256
let g:airline_theme='hybrid'
let g:airline_section_y = ""

" -----------------------
" ULTISNIPS
" -----------------------

let g:UltiSnipsEditSplit="vertical"
