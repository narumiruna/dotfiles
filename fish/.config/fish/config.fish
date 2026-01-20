if status is-interactive
    # Commands to run in interactive sessions can go here
end


source ~/.config/fish/alias.fish

# echo 'uv generate-shell-completion fish | source' > ~/.config/fish/completions/uv.fish
# echo 'uvx --generate-shell-completion fish | source' > ~/.config/fish/completions/uvx.fish
# echo 'atuin gen-completions --shell fish | source' > ~/.config/fish/completions/atuin.fish

atuin init fish --disable-up-arrow | source
starship init fish | source
