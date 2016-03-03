function! Load(path)
  if filereadable(glob(a:path))
    exec "source " . a:path
  endif
endfunction

function! ConfigFilePath(file)
  return "~/dotfiles/vim/" . a:file
endfunction

function! RenameCurrentFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

function! TrimWhiteSpace()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l, c)
endfunction
