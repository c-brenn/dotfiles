set statusline=%f 
set statusline+=\ %m
set statusline+=\ \ %y
set statusline+=%=(%l:%c)
set statusline+=%{fugitive#statusline()}

hi StatusLine ctermbg=15 ctermfg=8
