Plug 'tell-k/vim-autopep8'

let g:autopep8_disable_show_diff=1
let g:autopep8_ignore="E501"

autocmd FileType python autocmd BufWritePre <buffer> call Autopep8()
