local prefix = "export EDITOR=$HOME/.local/bin/lvim \n"

local variables = {
	terminal = "kitty",
	modkey = "Mod4",
	filemanager = prefix .. "kitty ranger",
	colorpicker = "gpick --pick",
	firefox = "firefox",
	browser = " ",
	app_launcher = 'rofi -modi "drun" -show drun',
}

return variables
