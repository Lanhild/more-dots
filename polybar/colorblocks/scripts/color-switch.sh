#!/usr/bin/env bash

SDIR="$HOME/.config/polybar/colorblocks/scripts"
WAL="$HOME/Pictures/Wallpapers"

# Launch Rofi
MENU="$(rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p '' \
-theme $SDIR/rofi/styles.rasi \
<<< "♥ amber|♥ blue|♥ blue-gray|♥ brown|♥ cyan|♥ deep-orange|\
♥ deep-purple|♥ green|♥ gray|♥ indigo|♥ blue-light|\
♥ pink|♥ red|♥ teal|♥ yellow|")"
            case "$MENU" in
				## Light Colors
				*amber) wal -i $WAL/0034.png && pywalfox update & ;;
				*blue) wal -i $WAL/0087.png && pywalfox update & ;;
				*blue-gray) wal -i $WAL/0088.png && pywalfox udpate & ;;
				*brown) wal -i $WAL/0062.png && pywalfox update & ;;
				*cyan) wal -i $WAL/0077.png && pywalfox update & ;;
				*deep-orange) wal -i $WAL/0047.png && pywalfox update & ;;
				*deep-purple) wal -i $WAL/0072.png && pywalfox update & ;;
				*green) wal -i $WAL/0039.png && pywalfox update & ;;
				*gray) wal -i $WAL/0084.png && pywalfox update & ;;
				*indigo) wal -i $WAL/0080.png && pywalfox update & ;;
				*blue-light) wal -i $WAL/0077.png && pywalfox update & ;;
				*pink) wal -i $WAL/0066.png && pywalfox update & ;;
				*red) wal -i $WAL/0057.png && pywalfox update & ;;
				*teal) wal -i $WAL/0030.png && pywalfox update & ;;
				*yellow) wal -i $WAL/0090.png && pywalfox update & ;;
            esac
