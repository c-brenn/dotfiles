" set a map leader for more key combos
let mapleader = ' '
let g:mapleader = ' '

" Source vimrc
nnoremap <leader>R :so ~/.vimrc<CR>

" Fuzzy search
nnoremap <silent> <C-p> :FZF<CR>

" Does exactly what it says on the tin
nnoremap <Leader>tw :call TrimWhitespace()<CR>
au BufWritePre *.rb :%s/\s\+$//e

nnoremap ]h :set hls<CR>
nnoremap [h :set nohls<CR>

if exists('$TMUX')
  let g:rspec_command = 'call VimuxRunCommand("bundle exec rspec {spec} --format progress && exit")'
else
  let g:rspec_command = "Dispatch bundle exec rspec {spec} --format progress"
endif
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

function! TrimWhitespace()
  %s/\s\+$//e
endfunc
