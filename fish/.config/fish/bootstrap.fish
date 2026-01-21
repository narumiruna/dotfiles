if not type -q uv
    cargo install --locked uv
end

if not type -q atuin
    cargo install --locked atuin
end

if not type -q zoxide
    cargo install --locked zoxide
end

if not type -q starship
   cargo install --locked starship
end

if not type -q fnm
    cargo install --locked fnm
end

if not type -q pyenv
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
end

if not type -q ouch
    cargo install --locked ouch
end

if not type -q lsd
    cargo install --locked lsd
end

if not type -q rg
    cargo install --locked ripgrep
end

if not type -q bat
    cargo install --locked bat
end

if not type -q fd
    cargo install --locked fd-find
end
