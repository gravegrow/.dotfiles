local path_to_log = '$HOME/maya/output.log'

vim.keymap.set('n', '<leader>mo', Format(':sview %s|set ft=mel|resize 10<cr>', path_to_log))
