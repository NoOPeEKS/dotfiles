#!/usr/bin/env bash

# Define style path
STYLE="$HOME/.config/wlogout/style.css"
LAYOUT="$HOME/.config/wlogout/layout"

# Make sure the directories exist
mkdir -p $(dirname $STYLE)
mkdir -p $(dirname $LAYOUT)

# Create or overwrite the style file
cat > "$STYLE" << 'EOF'
* {
    background-image: none;
    font-family: "JetBrainsMono Nerd Font";
}

window {
    background-color: rgba(12, 12, 12, 0.9);
}

button {
    color: #FFFFFF;
    background-color: #1e1e2e;
    border-style: solid;
    border-width: 2px;
    background-repeat: no-repeat;
    background-position: center;
    background-size: 25%;
    border-radius: 8px;
    margin: 5px;
    transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
}

button:focus, button:active, button:hover {
    background-color: #89b4fa;
    outline-style: none;
    border-color: #89b4fa;
    box-shadow: 0 0 8px 2px #89b4fa;
}

#lock {
    background-image: image(url("/usr/share/wlogout/icons/lock.png"), url("/usr/local/share/wlogout/icons/lock.png"));
}

#logout {
    background-image: image(url("/usr/share/wlogout/icons/logout.png"), url("/usr/local/share/wlogout/icons/logout.png"));
}

#suspend {
    background-image: image(url("/usr/share/wlogout/icons/suspend.png"), url("/usr/local/share/wlogout/icons/suspend.png"));
}

#hibernate {
    background-image: image(url("/usr/share/wlogout/icons/hibernate.png"), url("/usr/local/share/wlogout/icons/hibernate.png"));
}

#shutdown {
    background-image: image(url("/usr/share/wlogout/icons/shutdown.png"), url("/usr/local/share/wlogout/icons/shutdown.png"));
}

#reboot {
    background-image: image(url("/usr/share/wlogout/icons/reboot.png"), url("/usr/local/share/wlogout/icons/reboot.png"));
}
EOF

# Create or overwrite the layout file
cat > "$LAYOUT" << 'EOF'
{
    "label" : "lock",
    "action" : "swaylock",
    "text" : "Lock",
    "keybind" : "l"
}
{
    "label" : "hibernate",
    "action" : "systemctl hibernate",
    "text" : "Hibernate",
    "keybind" : "h"
}
{
    "label" : "logout",
    "action" : "hyprctl dispatch exit 0",
    "text" : "Logout",
    "keybind" : "e"
}
{
    "label" : "shutdown",
    "action" : "systemctl poweroff",
    "text" : "Shutdown",
    "keybind" : "s"
}
{
    "label" : "suspend",
    "action" : "systemctl suspend",
    "text" : "Suspend",
    "keybind" : "u"
}
{
    "label" : "reboot",
    "action" : "systemctl reboot",
    "text" : "Reboot",
    "keybind" : "r"
}
EOF

# Launch wlogout with custom style and layout
wlogout \
    --buttons-per-row 3 \
    --column-spacing 50 \
    --row-spacing 50 \
    --layout "$LAYOUT" \
    --css "$STYLE"
