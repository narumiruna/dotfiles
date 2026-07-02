# disable the default greeting
set -g fish_greeting ""

fish_add_path -m $HOME/.local/bin $HOME/.cargo/bin

if status is-interactive
    starship init fish | source
    zoxide init fish | source
end
