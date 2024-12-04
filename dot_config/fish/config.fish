
source ~/.bash_aliases

set -gx SHELL (command --search fish)

if status is-interactive
    # Commands to run in interactive sessions can go here
    # source ~/.asdf/asdf.fish
    mise activate fish | source

    set -gx LESSOPEN "| ~/.config/lessfilter %s"
    set -gx LESS '-cgir'

    set -gx FZF_DEFAULT_OPTS "--bind 'ctrl-y:execute-silent(printf {} | cut -f 2- | wl-copy --trim-newline)' --bind '?:toggle-preview' --bind 'ctrl-a:toggle-all' --cycle --layout=reverse --border --preview-window=wrap --marker='*' --height=80% --min-height=20"
    set fzf_fd_opts --one-file-system --strip-cwd-prefix --follow --hidden --exclude '.git' --exclude 'node_modules' --exclude '.var'
    set -x fzf_preview_dir_cmd eza -A --group-directories-first --icons --color always -1
    # set -x fzf_preview_dir_cmd 'lsd -LA --color=always -1'
    set fzf_diff_highlighter delta

    # hydro prompt
    # set -g hydro_multiline true
    # set -g hydro_fetch true
    # set -g fish_prompt_pwd_dir_length 3
    # set -g hydro_color_pwd $fish_color_host
    # set -g hydro_color_git $fish_color_option
    # set -g hydro_color_prompt $fish_color_operator
    
    set -g tide_character_color $fish_color_operator
    set -g tide_left_prompt_items pwd git newline character
    set -g tide_pwd_color_dirs $fish_color_host

else
  mise activate fish --shims | source
end

