exec swayidle \
     timeout 1 "swaylock -f" \
     timeout 2 "swaymsg 'output * dpms off'" \
     resume "swaymsg 'output * dpms on' && pkill -n swayidle" \
     before-sleep "swaylock -f"
