set nocompatible
filetype off
runtime macros/matchit.vim

for config_file in ['plugins', 'keybinds', 'general', 'airline', 'syntastic', 'colours', 'ultisnips']
  let file_path = "~/dotfiles/vim.conf/" . config_file . ".vim"
  if filereadable(expand(file_path))
    exec "source " file_path
  endif
endfor

