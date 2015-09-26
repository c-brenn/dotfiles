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

highlight CursorLineNR ctermfg=red
highlight SignColumn ctermbg=black
highlight lineNr ctermbg=black
highlight GitGutterAdd ctermbg=black
highlight GitGutterChange ctermbg=black
highlight GitGutterDelete ctermbg=black
highlight GitGutterChangeDelete ctermbg=black

augroup GutterColourSet
  autocmd!
  autocmd ColorScheme * hi CursorLineNR ctermfg=black
  autocmd ColorScheme * hi SignColumn ctermbg=black
  autocmd ColorScheme * hi lineNr ctermbg=black
  autocmd ColorScheme * hi GitGutterAdd ctermbg=black
  autocmd ColorScheme * hi GitGutterChange ctermbg=black
  autocmd ColorScheme * hi GitGutterDelete ctermbg=black
  autocmd ColorScheme * hi GitGutterChangeDelete ctermbg=black
augroup END
