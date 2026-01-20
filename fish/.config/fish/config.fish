fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.atuin/bin

if status is-interactive
    # Commands to run in interactive sessions can go here

    # https://docs.atuin.sh/cli/guide/installation/
    # curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
    atuin init fish --disable-up-arrow | source

    # https://github.com/ajeetdsouza/zoxide
    # cargo install zoxide --locked
    zoxide init fish | source

    # https://starship.rs/guide/
    # cargo install starship --locked
    starship init fish | source

    source ~/.config/fish/alias.fish
end

