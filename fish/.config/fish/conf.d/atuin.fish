fish_add_path -m $HOME/.atuin/bin

if status is-interactive
    atuin init fish --disable-up-arrow | source
end
