# disable the default greeting
set -g fish_greeting ""

if status is-interactive
    starship init fish | source
    zoxide init fish | source
end
