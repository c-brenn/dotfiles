" Files
nnoremap <leader>ff :FzfFiles<cr>
nnoremap <leader>fs :w<cr>
nnoremap <leader>fr :call RenameCurrentFile()<cr>

" Buffers
nnoremap <leader>bb :FzfBuffers<cr>

" Tests
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tt :TestFile<CR>
nnoremap <leader>ta :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tg :TestVisit<CR>

" Text
nnoremap <leader>xw :call TrimWhiteSpace()<cr>
