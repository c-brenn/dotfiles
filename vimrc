set nocompatible
filetype off
runtime macros/matchit.vim
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
" Moving Between Buffers
Plug 'troydm/easybuffer.vim'
" Wizard Completion
Plug 'Valloric/YouCompleteMe'
" Magical Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  }
" -- Languages --
Plug 'scrooloose/syntastic'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'othree/html5.vim'
" -- Frameworks --
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
call plug#end()

" -----------------------
" General Config
" -----------------------
filetype plugin indent on
syntax on

" set a map leader for more key combos
let mapleader = ','
let g:mapleader = ','

let g:airline_theme='base16'
let g:airline_powerline_fonts = 1

"----------------------
" Buffers
"----------------------
set hidden
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 1"
" cycle through buffers
map <Leader><tab> :bn<CR>
map <Leader>` :bp<CR>
map ` :EasyBuffer<CR>"

set number
set noswapfile
set nobackup
set nowritebackup
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set ttyfast
set hlsearch
set incsearch
set ignorecase
set smartcase
set noerrorbells
set visualbell
set laststatus=2
set ttimeoutlen=50
set diffopt+=vertical
set scrolloff=10                    " keep cursor relatively centered
set sidescrolloff=10"
" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers=['']
let g:syntastic_scss_checkers = []
let g:syntastic_disabled_filetype = ['scss']
" -----------------------
" Key Mappings
" -----------------------
" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor
nnoremap <leader>R :so ~/.vimrc<CR>:AirlineRefresh<CR>
nnoremap <C-p> :FZF<CR>
" Textmate style indentation
vmap <leader>[ <gv
vmap <leader> ] >gv
nmap <leader>[ <<
nmap <leader>] >>
nnoremap <Leader>tw :call TrimWhitespace()<CR>
" -----------------------
" Colors
" -----------------------
set background=dark
colorscheme base16-railscasts
highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=12
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1
" Git gutter colors
highlight GitGutterAdd ctermbg=black
highlight GitGutterChange ctermbg=black
highlight GitGutterDelete ctermbg=black
highlight GitGutterChangeDelete ctermbg=black

hi CursorLineNR ctermbg=black
augroup ColourSet
    autocmd!
  autocmd ColorScheme * hi CursorLineNR ctermbg=black
  autocmd ColorScheme * hi SignColumn ctermbg=black
  autocmd ColorScheme * hi lineNr ctermbg=black
  autocmd ColorScheme * hi GitGutterAdd ctermbg=black
  autocmd ColorScheme * hi GitGutterChange ctermbg=black
  autocmd ColorScheme * hi GitGutterDelete ctermbg=black
  autocmd ColorScheme * hi GitGutterChangeDelete ctermbg=black
augroup END

function! SourceVimrc()
  exec "so ~/.vimrc"
  exec "AirlineRefresh"
endfunction

function! TrimWhitespace()
  %s/\s\+$//e
endfunc

