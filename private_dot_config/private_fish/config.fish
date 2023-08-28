
source ~/.bash_aliases

if status is-interactive
    # Commands to run in interactive sessions can go here
    source ~/.asdf/asdf.fish
    starship init fish | source
end
