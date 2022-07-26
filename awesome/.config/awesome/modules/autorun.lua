local apps = {
    'pamac-tray',
    'blueman-applet',
    'picom',
    'numlockx',
    'nitrogen --restore --set-zoom-fill',
    'nvidia-settings --load-config-only',
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1',
    '$HOME/Applications/OpenRGB-x86_64_dfceb6262d7668d4ab34d4b077c82c32.AppImage -p main.orp',
}

local awful = require('awful')

for _, app in ipairs(apps) do
    awful.spawn.with_shell(app .. ' &')
end
