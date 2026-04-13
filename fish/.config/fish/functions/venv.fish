function venv --description 'Activate local .venv if it exists.'
    if test -f .venv/bin/activate.fish
        source .venv/bin/activate.fish
    else
        echo ".venv not found."
    end
end
