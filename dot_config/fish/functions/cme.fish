function cme --description 'Edit files managed by chezmoi'
set -f fd_cmd (command -v fdfind || command -v fd  || echo "fd")
set -f fzf_arguments --multi --ansi --preview='_fzf_preview_file (eval echo -- {})' $fzf_dir_opts $fzf_directory_opts
set -f managed (chezmoi managed --exclude='dirs,externals,scripts' | sort -d)
set -f token (commandline --current-token)
set -f expanded_token (eval echo -- $token)
set -f unescaped_exp_token (string unescape -- $expanded_token)
set -f file_paths_selected (printf '~/%s'\n $managed | _fzf_wrapper $fzf_arguments)

if test $status -eq 0
eval $EDITOR $file_paths_selected
end
commandline --function repaint
end
