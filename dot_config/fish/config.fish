
source ~/.bash_aliases

set -gx SHELL (command --search fish)

if status is-interactive
    # Commands to run in interactive sessions can go here
    source ~/.asdf/asdf.fish
    
    set -gx LESSOPEN "| ~/.config/lessfilter %s"
    set -gx LESS '-cgiRF'

    set -gx FZF_DEFAULT_OPTS --bind 'ctrl-y:execute-silent(printf {} | cut -f 2- | wl-copy --trim-newline)' --bind '?:toggle-preview' --bind 'ctrl-a:toggle-all' --cycle --layout=reverse --border --preview-window=wrap --marker='*' --height=80% --min-height=20
    set fzf_fd_opts --one-file-system --strip-cwd-prefix --follow --hidden --exclude '.git' --exclude 'node_modules' --exclude '.var'
    set -x fzf_preview_dir_cmd exa -a --group-directories-first --icons -1
    # set -x fzf_preview_dir_cmd 'lsd -LA --color=always -1'
    set fzf_diff_highlighter delta

    starship init fish | source
end

