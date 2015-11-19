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
Plug 'thoughtbot/vim-rspec'
Plug 'c-brenn/mix-test.vim'
Plug 'tpope/vim-dispatch'

" -- COMPLETION --
"   -- Auto Completion
Plug 'ervandew/supertab'
"   -- Pair thingies
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
"   -- Comment thingies
Plug 'tpope/vim-commentary'
"   -- Surround thingies
Plug 'tpope/vim-surround'
" -- Swizzle Statements
Plug 'AndrewRadev/splitjoin.vim'

" -- MAGICAL SEARCH --
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  }

" -- SYNTAX --
Plug 'scrooloose/syntastic'
"   -- languages
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'vim-scripts/haskell.vim'
Plug 'elixir-lang/vim-elixir'
"   -- Frameworks
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'

" -- NAVIGATION --
Plug 'tpope/vim-unimpaired'

" -- COLOURS --
Plug 'altercation/vim-colors-solarized'

" -- TEXT OBJECTS --
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'

" -- MISC --
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-vinegar'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
call plug#end()

" -----------------------
" KEY BINDINGS
" -----------------------

let mapleader = ' '
let g:mapleader = ' '

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

nnoremap <leader>R :so ~/.vimrc<CR>

nnoremap <silent> <C-p> :FZF<CR>

nnoremap <Leader>tw :call TrimWhitespace()<CR>
au BufWritePre *.rb :call TrimWhitespace()

let g:rspec_command = "Dispatch bundle exec rspec {spec}"
let g:mix_test_command = "Dispatch mix test {test}"
map <Leader>t :call TestCurrentFile()<CR>
map <Leader>s :call TestNearest()<CR>
map <Leader>a :call TestAll()<CR>
map <Leader>l :call TestLast()<CR>

function! TestCurrentFile()
  if InMixTestFile()
    call MixRunCurrentTestFile()
  else
    call RunCurrentSpecFile()
  endif
endfunction

function! TestNearest()
  if InMixTestFile()
    call MixRunCurrentTest()
  else
    call RunNearestSpec()
  endif
endfunction

function! TestAll()
  if InMixProject()
    call MixRunAllTests()
  else
    call RunAllSpecs()
  endif
endfunction

function! TestLast()
  if InMixProject()
    call MixRunLastTest()
  else
    call RunLastSpec()
  endif
endfunction

map <Leader>d :Dispatch<CR>
autocmd FileType elixir let b:dispatch = 'mix test %'

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
set expandtab
set smartcase
set ignorecase

augroup FileTypeSettings
  autocmd!
  autocmd FileType html setlocal ts=2 sw=2 expandtab
  autocmd FileType ruby setlocal ts=2 sw=2 expandtab
  autocmd FileType vim setlocal ts=2 sw=2 expandtab keywordprg=:help
  autocmd FileType haskell setlocal ts=2 sw=2 expandtab
  autocmd FileType python setlocal ts=4 sw=4 expandtab
  autocmd FileType javascript setlocal ts=2 sw=2 expandtab
  autocmd FileType coffee setlocal ts=2 sw=2 expandtab
  autocmd FileType sh,zsh setlocal ts=2 sw=2 expandtab
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.css set filetype=scss
  autocmd FileType markdown setlocal spell
  autocmd FileType gitcommit setlocal spell
  autocmd FileType text setlocal spell
augroup END

autocmd FileType *
      \ if &omnifunc != '' |
      \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
      \   call SuperTabChain(&omnifunc, "<c-p>") |
      \ endif

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
let g:syntastic_elixir_checkers=['elixir']
let g:syntastic_enable_elixir_checker = 1

" -----------------------
" STATUSLINE
" -----------------------

let g:lightline= {
      \ 'colorscheme' : 'jellybeans',
      \ }

" -----------------------
" COLOURS
" -----------------------

set background=dark
colorscheme solarized

" -----------------------
" LOCAL VIMRC
" -----------------------

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
