colorscheme gruvbox
set background=dark

" Gutter colours
let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=236 guibg=#1d2021
highlight lineNr ctermbg=236 guibg=#1d2021
highlight GitGutterAdd ctermfg=142 ctermbg=236 guibg=#1d2021 guifg=#b8bb26
highlight GitGutterChange ctermfg=109 ctermbg=236 guibg=#1d2021 guifg=#83a598
highlight GitGutterDelete ctermfg=167 ctermbg=236 guibg=#1d2021 guifg=#fb4934
highlight GitGutterChangeDelete ctermfg=208 ctermbg=236 guibg=#1d2021 guifg=#fe8019
highlight ModeMsg ctermfg=142 guifg=#b8bb26

" StatusLine colours
highlight User1 ctermfg=110 ctermbg=236 guifg=#83a598 guibg=#282828
highlight User2 ctermfg=203 ctermbg=236 guibg=#282828 guifg=#fb4934
highlight User3 ctermfg=213 ctermbg=236 guibg=#282828 guifg=#d3869b
highlight User4 ctermfg=175 ctermbg=236 guibg=#282828 guifg=#fe8019
highlight User5 ctermfg=142 ctermbg=236 guibg=#282828 guifg=#b8bb26

highlight StatusLine ctermbg=white ctermfg=236 guifg=#282828 guibg=#fdf4c1
highlight StatusLineNC ctermbg=white ctermfg=236 guifg=#282828 guibg=#504945
highlight VertSplit ctermfg=white ctermbg=236 guibg=#282828

augroup GutterColourSet
  autocmd!
  autocmd ColorScheme * highlight SignColumn ctermbg=236 guibg=#1d2021
  autocmd ColorScheme * highlight lineNr ctermbg=236 guibg=#1d2021
  autocmd ColorScheme * highlight GitGutterAdd ctermfg=142 ctermbg=236 guibg=#1d2021 guifg=#b8bb26
  autocmd ColorScheme * highlight GitGutterChange ctermfg=109 ctermbg=236 guibg=#1d2021 guifg=#83a598
  autocmd ColorScheme * highlight GitGutterDelete ctermfg=167 ctermbg=236 guibg=#1d2021 guifg=#fb4934
  autocmd ColorScheme * highlight GitGutterChangeDelete ctermfg=208 ctermbg=236 guibg=#1d2021 guifg=#fe8019
  autocmd ColorScheme * highlight ModeMsg ctermfg=142 guifg=#b8bb26
  autocmd ColorScheme * highlight User1 ctermfg=110 ctermbg=236 guifg=#83a598 guibg=#282828
  autocmd ColorScheme * highlight User2 ctermfg=203 ctermbg=236 guibg=#282828 guifg=#fb4934
  autocmd ColorScheme * highlight User3 ctermfg=213 ctermbg=236 guibg=#282828 guifg=#d3869b
  autocmd ColorScheme * highlight User4 ctermfg=175 ctermbg=236 guibg=#282828 guifg=#fe8019
  autocmd ColorScheme * highlight User5 ctermfg=142 ctermbg=236 guibg=#282828 guifg=#b8bb26
  autocmd ColorScheme * highlight StatusLine ctermbg=white ctermfg=236 guifg=#282828 guibg=#fdf4c1
  autocmd ColorScheme * highlight StatusLineNC ctermbg=white ctermfg=236 guifg=#282828 guibg=#504945
  autocmd ColorScheme * highlight VertSplit ctermfg=white ctermbg=236 guibg=#282828
augroup END