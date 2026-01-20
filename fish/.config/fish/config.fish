pyenv init - fish | source
fnm env --use-on-cd --shell fish | source

if status is-interactive
    atuin init fish --disable-up-arrow | source
    starship init fish | source
    zoxide init fish | source
end
