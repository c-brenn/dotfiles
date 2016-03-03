function! Load(path)
  if filereadable(glob(a:path))
    exec "source " . a:path
  endif
endfunction

function! ConfigFilePath(file)
  return "~/dotfiles/vim/" . a:file
endfunction
