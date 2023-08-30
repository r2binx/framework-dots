
function _fzf_theme
      set -l theme
      if not test -f /tmp/theme
          read $theme </tmp/theme
      else if not test (gsettings get org.gnome.desktop.interface color-scheme) = \'default\'
          set theme dark
      else
          set theme light
      end

      echo $theme

end

function fzf
    set -l color
    switch (_fzf_theme)
        case light
            # Latte 
            # color="--color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39,fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78,marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39"     
            # Frappe
            set color "--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284,fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf,marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"
        case dark 
            # Mocha
            set color "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8,fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc,marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
    end
    
    command fzf $color $argv
  
end
