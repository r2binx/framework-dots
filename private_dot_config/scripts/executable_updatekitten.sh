#!/usr/bin/env zsh

# Launch kitty, update system and flatpak packages in parallel
#
#
info_done='echo "\nUpdating done..\nPress enter to exit"; read'

main=$(kitty @ launch \
        --type=os-window \
        --os-window-class=updatekitten \
        --title='System Update' \
        zsh -c "echo 'Looking for system updates\n\n'; yay; $info_done") \
        && kitty @ launch -m id:$main \
        --type=window \
        --title='Flatpak Update' \
        zsh -c "flatpak update && touch /var/lib/pacman/local/flatpak-arch-update; $info_done" &> /dev/null
