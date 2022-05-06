local awful = require("awful")

awful.spawn("pamac-tray")
awful.spawn("blueman-applet")
awful.spawn("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

awful.spawn.with_shell("picom --experimental-backends &")
awful.spawn.with_shell("nitrogen --restore --set-zoom-fill &")
awful.spawn.with_shell("nvidia-settings --load-config-only &")
awful.spawn.with_shell("numlockx &")
awful.spawn.with_shell(
	"/home/gravegrow/Applications/OpenRGB-x86_64_dfceb6262d7668d4ab34d4b077c82c32.AppImage -p main.orp"
)
