# disable the default greeting
set -g fish_greeting ""

if status is-interactive
    fish_add_path $HOME/.atuin/bin
    atuin init fish | source

    starship init fish | source
    zoxide init fish | source

    source ~/.config/fish/abbr.fish
end
