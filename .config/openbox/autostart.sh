# Run the system-wide support stuff
. $GLOBALAUTOSTART

# Programs to launch at startup
#.HOME/.fehbg &
xcompmgr -cCfF -t-5 -l-5 -r4.2 -o.55 -D4 &

# SCIM support (for typing non-english characters)
#export LC_CTYPE=ja_JP.utf8
export XMODIFIERS=@im=SCIM
export GTK_IM_MODULE=scim
export QT_IM_MODULE=scim
scim -d &

# Disable Nautilus desktop.
gconftool-2 -s -t bool /apps/nautilus/preferences/show_desktop false &
# Do not let Nautilus set the background image.
gconftool-2 -s -t bool /desktop/gnome/background/draw_background false &

# Make Nautilus use spatial mode, should start-up quicker.
gconftool-2 -s -t bool /apps/nautilus/preferences/always_use_browser true &
# Make Nautilus show the advanced permissions dialog
gconftool-2 -s -t bool /apps/nautilus/preferences/show_advanced_permissions true &

#Launch some apps
tint2 &
gnome-settings-daemon &
gnome-volume-manager &
nm-applet --sm-disable &
gnome-volume-control-applet &

#Launch some stuff to remind me to get started on work
nautilus ~/CASE4/ &
terminator ~/Code/Source-Analysis/ &
gvim -S ~/Code/Source-Analysis/project &

#Conky
#(sleep 5s && bash ~/wallpaper.sh) &
#(sleep 2s && conky -bo) &
#feh --bg-scale ~/Pictures/Orbe_n__Wood___WP-1024x768.jpg &
pytyle &
xflux -l 53.5 -g -6.2 &
