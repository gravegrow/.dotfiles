local awful = require("awful")

awful.spawn("killall volumeicon")
awful.spawn("pamac-tray")
awful.spawn("msm_notifier")
awful.spawn("nm-applet")
awful.spawn("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

awful.spawn.with_shell("picom --experimental-backends &")
awful.spawn.with_shell("nitrogen --restore --set-zoom-fill &")
awful.spawn.with_shell("nvidia-settings --load-config-only &")
awful.spawn.with_shell("sleep 10 && exec volumeicon &")



