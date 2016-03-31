" Plugin Config

" vim-ruby
let ruby_operators    = 1
let ruby_no_expensive = 1

" elixir.nvim
let g:elixir_autobuild = 0

let g:fzf_command_prefix = 'Fzf'

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Only use my snippets and keep them in version control
set rtp+=~/dotfiles/vim
let g:UltiSnipsSnippetsDir=ConfigFilePath('vim-snippets')
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'vim-snippets']

" Save VCM bindings
let g:vcm_default_maps = 0
imap <S-Tab> <Plug>vim_completes_me_backward
imap <Tab> <Plug>vim_completes_me_forward

" Quick Scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_first_occurrence_highlight_color = 155
let g:qs_second_occurrence_highlight_color = 81

" Vim-Test
let test#strategy = "dispatch"

" Elm
" let g:elm_format_autosave = 1
