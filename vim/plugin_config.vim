" Plugin Config

" vim-ruby
let ruby_operators    = 1
let ruby_no_expensive = 1


" Fzf
let g:fzf_command_prefix = 'Fzf'

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Only use my snippets and keep them in version control
set rtp+=~/dotfiles/vim
let g:UltiSnipsSnippetsDir=ConfigFilePath('vim-snippets')
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'vim-snippets']

" Quick Scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_first_occurrence_highlight_color = 155
let g:qs_second_occurrence_highlight_color = 81

" Airline
let g:airline_powerline_fonts = 1

" Neoterm
let g:neoterm_size = 15

" Alignment
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" haskell
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
