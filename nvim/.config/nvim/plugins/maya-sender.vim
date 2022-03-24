Plug 'lexfrench/vim-jakesender'

augroup MayaSend
    autocmd!
    autocmd User PlugLoaded ++nested nnoremap <leader>m :SendBufferToMaya<cr>
    autocmd User PlugLoaded ++nested vnoremap <leader>m :SendSelectionToMaya<cr>
augroup end


