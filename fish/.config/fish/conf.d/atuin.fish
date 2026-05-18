test -d $HOME/.atuin/bin; or return

fish_add_path -m $HOME/.atuin/bin

if status is-interactive
    type -q atuin; or return
    atuin init fish --disable-up-arrow | source
end
