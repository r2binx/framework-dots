#!/bin/sh

CHROMIUM_CONF=~/.config/chrome-flags.conf

set_bat_theme() {
	themes=("Catppuccin-frappe" "Catppuccin-mocha")

	case $1 in
	dark)
		selected="${themes[1]}"
		;;
	light)
		selected="${themes[0]}"
		;;
	*)
		echo "Invalid bat theme: ${1}"
		return
		;;
	esac
	sed -i -r "s/^--theme=.*/--theme="\""${selected}"\""/" ~/.config/bat/config
}

set_adw_gtk_theme() {
	themes=(frappe.css mocha.css)
	dir_3=~/.config/gtk-3.0
	dir_4=~/.config/gtk-4.0

	case $1 in
	dark)
		# CSS override for dark mode
		cp "${dir_3}/${themes[1]}" "${dir_3}/gtk.css"
		cp "${dir_4}/${themes[1]}" "${dir_4}/gtk.css"
		sed -i -e "s/^\(gtk-application-prefer-dark-theme=*\)\(.*\)*$/\11/" $dir_3/settings.ini $dir_4/settings.ini
		sed -i -e "s/^\(gtk-theme-name=*\)\(.*\)*$/\1'adw-gtk3-dark'/" "$dir_3"/settings.ini
		;;
	light)
		#cp "${dir_3}/${themes[0]}" "${dir_3}/gtk.css"
		#cp "${dir_4}/${themes[0]}" "${dir_4}/gtk.css"
		# No CSS override for light mode
		echo "" >"${dir_3}/gtk.css"
		echo "" >"${dir_4}/gtk.css"
		sed -i -e "s/^\(gtk-application-prefer-dark-theme=*\)\(.*\)*$/\10/" "$dir_3"/settings.ini "$dir_4"/settings.ini
		sed -i -e "s/^\(gtk-theme-name=*\)\(.*\)*$/\1'adw-gtk3'/" "$dir_3"/settings.ini
		;;
	*)
		echo "Invalid argument: ${1}"
		return
		;;
	esac

}

set_adw_ff_theme() {
	themes=(frappeChrome.css mochaChrome.css)
	dir=/usr/lib/firefox-gnome-theme

	case $1 in
	dark)
		cp "${dir}/${themes[1]}" "${dir}/customChrome.css"
		;;
	light)
		cp "${dir}/${themes[0]}" "${dir}/customChrome.css"
		;;
	*)
		echo "Invalid argument: ${1}"
		return
		;;
	esac
}

set_lunarvim_theme() {
	sed -i -r "s/^vim.g.catppuccin_flavour = .*/vim.g.catppuccin_flavour = "\""${1}"\""/" ~/.config/lvim/config.lua
}

set_xresources_theme() {
	themes=("frappe.Xresources" "mocha.Xresources")

	case $1 in
	dark)
		selected="${themes[1]}"
		;;
	light)
		selected="${themes[0]}"
		;;
	*)
		echo "Invalid theme: ${1}"
		return
		;;
	esac

	sed -i -r "s@^#include \"$XDG_CONFIG_HOME/xresourcecolors/.*\"@#include \"$XDG_CONFIG_HOME/xresourcecolors/${selected}\"@" ~/.Xresources
	[ -n "${DISPLAY}" ] && xrdb ~/.Xresources

}

set_zathura_theme() {
	themes=("catppuccin-latte" "catppuccin-mocha")

	case $1 in
	dark)
		selected="${themes[1]}"
		;;
	light)
		selected="${themes[0]}"
		;;
	*)
		echo "Invalid theme: ${1}"
		return
		;;
	esac

	sed -i -r "s/^include catppuccin.*/include ${selected}/" ~/.config/zathura/zathurarc
}

set_nvim_cat_flavour() {
	themes=("frappe" "mocha")

	case $1 in
	dark)
		selected="${themes[1]}"
		;;
	light)
		selected="${themes[0]}"
		;;
	*)
		echo "Invalid nvim theme: ${1}"
		return
		;;
	esac

	for SOCK in "${XDG_RUNTIME_DIR}"/nvim.*; do
		if [ -f "${SOCK}" ]; then
			nvim --server "${SOCK}" --remote-send "<CMD>:Catppuccin ${selected}<CR>" >/dev/null
		fi
	done

	sed -i "/flavour/c\ \ \ \ \ \ flavour = \"${selected}\"," ~/.config/nvim/lua/user/plugins/community.lua
}

set_btop_theme() {
	themes=("catppuccin_frappe.theme" "catppuccin_mocha.theme")

	case $1 in
	dark)
		selected="${themes[1]}"
		;;
	light)
		selected="${themes[0]}"
		;;
	*)
		echo "Invalid btop theme: ${1}"
		return
		;;
	esac

	sed -i -r "s/^color_theme = .*/color_theme = "\""${selected}"\""/" ~/.config/btop/btop.conf
}

hypr_bg() {
	pic=("red_peach.png" "red_bkg5.png")

	case $1 in
	dark)
		selected="${pic[1]}"
		;;
	light)
		selected="${pic[0]}"
		;;
	*)
		echo "Invalid wallpaper selection: ${1}"
		return
		;;
	esac

	echo "exec = swaybg -m fill -i ~/Pictures/Wallpaper/${selected}" >~/.config/hypr/wallpaper.conf
}

hypr_cursor() {
	themes=("Bibata-Modern-Classic 24" "Bibata-Modern-Ice 24")

	case $1 in
	dark)
		selected="${themes[1]}"
		;;
	light)
		selected="${themes[0]}"
		;;
	*)
		echo "Invalid cursor theme: ${1}"
		return
		;;
	esac

	echo "exec = hyprctl setcursor ${selected}" >~/.config/hypr/cursor.conf
}

sway_bg() {
	pic=("red_peach.png" "red_bkg5.png")

	case $1 in
	dark)
		selected="${pic[1]}"
		;;
	light)
		selected="${pic[0]}"
		;;
	*)
		echo "Invalid wallpaper selection: ${1}"
		return
		;;
	esac

	echo "output * bg ~/Pictures/Wallpaper/${selected} fill" >~/.config/sway/wallpaper.conf
}

sway_cursor() {
	themes=("Bibata-Modern-Classic 24" "Bibata-Modern-Ice 24")

	case $1 in
	dark)
		selected="${themes[1]}"
		;;
	light)
		selected="${themes[0]}"
		;;
	*)
		echo "Invalid cursor theme: ${1}"
		return
		;;
	esac

	echo "seat seat0 xcursor_theme ${selected}" >~/.config/sway/cursor.conf
}

wofi_colors() {
	themes=("frappe.colors" "mocha.colors")

	case $1 in
	dark)
		selected="${themes[1]}"
		;;
	light)
		selected="${themes[0]}"
		;;
	*)
		echo "Invalid cursor theme: ${1}"
		return
		;;
	esac

	cp ~/.config/wofi/"${selected}" ~/.config/wofi/colors
}

chrome_light() {
	sed -i "/^--force-dark-mode/d" $CHROMIUM_CONF
	sed -i "/^--enable-features=WebUIDarkMode/d" $CHROMIUM_CONF
}

chrome_dark() {
	echo "--enable-features=WebUIDarkMode" >>$CHROMIUM_CONF
	echo "--force-dark-mode" >>$CHROMIUM_CONF
}

kitty_colorscheme() {
	diff_themes=("diff/diff-frappe.conf" "diff/diff-mocha.conf")
	themes=("Catppuccin Kitty Frappe" "Catppuccin Kitty Mocha")

	case $1 in
	dark)
		selected="${themes[1]}"
		selected_diff="${diff_themes[1]}"
		;;
	light)
		selected="${themes[0]}"
		selected_diff="${diff_themes[0]}"
		;;
	*)
		echo "Invalid kitty theme: ${1}"
		return
		;;
	esac

	kitty +kitten themes --reload-in=all "${selected}"
	sed -i -r "s@^include themes/.*@include ${selected_diff}@" ~/.config/kitty/diff.conf

}

set_gtk_settings() {

	case $1 in
	dark)
		gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
		gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
		gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'
		set_adw_gtk_theme dark
		;;
	light)
		gsettings set org.gnome.desktop.interface color-scheme 'default'
		gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'
		gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
		set_adw_gtk_theme light
		;;
	*)
		echo "invalid theme: ${1}"
		return
		;;
	esac
}

if [ "$1" = "light" ]; then
	echo "Setting light theme"
	set_bat_theme light
	set_zathura_theme light
	set_xresources_theme light
	set_gtk_settings light
	chrome_light
	#set_adw_ff_theme light
	wofi_colors light
	set_btop_theme light
	set_nvim_cat_flavour light
	kitty_colorscheme light
	echo "light" >/tmp/theme
	if [ "${XDG_CURRENT_DESKTOP}" = "sway" ]; then
		sway_cursor light
		sway_bg light
	fi
	if [ "${XDG_CURRENT_DESKTOP}" = "Hyprland" ]; then
		hypr_cursor light
		hypr_bg light
	fi
elif [ "$1" = "dark" ]; then
	echo "Setting dark theme"
	set_bat_theme dark
	set_xresources_theme dark
	set_zathura_theme dark
	set_gtk_settings dark
	chrome_dark
	#set_adw_ff_theme dark
	wofi_colors dark
	set_nvim_cat_flavour dark
	set_btop_theme dark
	kitty_colorscheme dark
	echo "dark" >/tmp/theme
	if [ "${XDG_CURRENT_DESKTOP}" = "sway" ]; then
		sway_cursor dark
		sway_bg dark
	fi
	if [ "${XDG_CURRENT_DESKTOP}" = "Hyprland" ]; then
		hypr_cursor dark
		hypr_bg dark
	fi
else
	echo "unknown parameter"
fi
