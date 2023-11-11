function fcd
  set -l INITIAL_QUERY $argv 
  set -x RG_PREFIX "rg --column --line-number --max-depth 1 --no-heading --color=always --smart-case "
  set -x FD_PREFIX "fd --one-file-system --follow --hidden --strip-cwd-prefix -a --ignore-case --exclude \'.git\' --exclude \'node_modules\' . --base-directory"
  set -l file
  set file (FZF_DEFAULT_COMMAND="$FD_PREFIX $PWD --type directory -d 1" \
    fzf --ansi --query "$INITIAL_QUERY" --preview="_fzf_preview_file {}" \
    --bind "ctrl-r:unbind(ctrl-r)+change-prompt(ripgrep> )+disable-search+reload($RG_PREFIX {q} || true)+rebind(change,ctrl-f)+transform-query(echo {q} > /tmp/rg-fzf-f; cat /tmp/rg-fzf-r)" \
    --bind="/:reload($FD_PREFIX {} --type directory -d 1)+clear-query" \
    --bind "ctrl-f:unbind(change,ctrl-f)+change-prompt(2. fzf> )+enable-search+rebind(ctrl-r)+transform-query(echo {q} > /tmp/rg-fzf-r; cat /tmp/rg-fzf-f)"
    )
  if test $status -eq 0
    if test -d "$file"
      eval (cd "$file")
    else if test -f "$file"
      eval ($EDITOR "$file")
    end
  end
  commandline -f repaint
end
