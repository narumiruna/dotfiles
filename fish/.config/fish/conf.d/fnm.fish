test -d $HOME/.cargo/bin; or return
fish_add_path -m $HOME/.cargo/bin

type -q env; or return
fnm env --use-on-cd --shell fish | source
