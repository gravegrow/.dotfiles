local path_to_log = '/home/gravegrow/maya/output.log'

vim.keymap.set('n', '<leader>mo', F(':sview %s|set ft=mel|resize 10<cr>', path_to_log))
