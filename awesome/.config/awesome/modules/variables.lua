local prefix = 'export EDITOR=$HOME/.local/bin/lvim \n'

local variables = {
    terminal = 'kitty',
    modkey = 'Mod4',
    filemanager = prefix .. 'kitty ranger',
    colorpicker = 'gpick --pick --single --no-start',
    firefox = 'firefox',
    browser = ' ',
    app_launcher = 'rofi -show drun -sorting-method fzf -sort',
}

return variables
