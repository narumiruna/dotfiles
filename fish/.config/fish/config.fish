if status is-interactive
    atuin init fish --disable-up-arrow | source
    starship init fish | source
    zoxide init fish | source

    source ~/.config/fish/abbr.fish
end
