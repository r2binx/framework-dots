
source ~/.bash_aliases

if status is-interactive
    # Commands to run in interactive sessions can go here
    source ~/.asdf/asdf.fish
    
    set -gx LESSOPEN "| ~/.config/lessfilter %s"
    set -gx LESS '-cgiRF'

    set fzf_fd_opts --one-file-system --strip-cwd-prefix --follow --hidden --exclude '.git' --exclude 'node_modules' --exclude '.var'
    set -x fzf_preview_dir_cmd exa -a --icons -1
    # set -x fzf_preview_dir_cmd 'lsd -LA --color=always -1'
    set fzf_diff_highlighter delta

    starship init fish | source
end

