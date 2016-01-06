" -- Statusline
function! S_modified()
  if !&modifiable || &readonly
    return ' '.emoji#for('lock').' '
  elseif &modified
    return ' '.emoji#for('pencil').' '
  else
    return ''
  endif
endfunction

function! S_fugitive()
  if fugitive#head() != ''
    return fugitive#statusline()
  else
    return ''
  endif
endfunction

function! S_noemake()
  if neomake#statusline#LoclistStatus() != ''
    return ' ' . neomake#statusline#LoclistStatus(' neomake: ')
  else
    return ''
  endif
endfunction

set statusline=                                                            " clear upon load
set statusline+=%1*
set statusline+=\ %{emoji#available()?emoji#for('sparkles').'\ ':''}       " sparkles
set statusline+=\ %n:\ %f                                                  " buffer + filename
set statusline+=%{S_modified()}                                            " modification
set statusline+=%3*
set statusline+=%{strlen(&filetype)?'\ ['.&filetype.']\ ':''}              " file info
set statusline+=%4*
set statusline+=%{S_fugitive()}                                   " git
set statusline+=%2*
set statusline+=%{S_noemake()}
set statusline+=%1*
set statusline+=%=%-30.(line:\ %l\ of\ %L,\ col:\ %c%V%)                   " position
set statusline+=%3*
set statusline+=\ %P\                                                      " percent
set statusline+=\ %{emoji#available()?emoji#for('sparkles').'\ ':''}       " sparkles

highlight User1 ctermfg=110 ctermbg=236 guifg=#83a598 guibg=#282828
highlight User2 ctermfg=203 ctermbg=236 guibg=#282828 guifg=#fb4934
highlight User3 ctermfg=213 ctermbg=236 guibg=#282828 guifg=#d3869b

" git gutter
highlight SignColumn ctermbg=black
highlight lineNr ctermbg=black
highlight GitGutterAdd ctermbg=black ctermfg=142
highlight GitGutterChange ctermbg=black ctermfg=109
highlight GitGutterDelete ctermbg=black ctermfg=167
silent! if emoji#available()
  let g:gitgutter_sign_added = emoji#for('herb')
  let g:gitgutter_sign_modified = emoji#for('maple_leaf')
  let g:gitgutter_sign_removed = emoji#for('rose')
  let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif


