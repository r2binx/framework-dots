function get-fzf-theme() {
    [ -f /tmp/theme ] && read theme < /tmp/theme || theme=$(gsettings get org.gnome.desktop.interface color-scheme)
    local -a color
    if [ $theme = "'default'" ] || [ $theme = "light" ]; then
        # Frappe
        color="--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284,fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf,marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

    else
        # Mocha
        color="--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8,fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc,marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
    fi
    
    command fzf $color "$@"
}

function fzf {
    get-fzf-theme "$@"
}

