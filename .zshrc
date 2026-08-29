autoload -Uz compinit
compinit

cd ~

eval "$(starship init zsh)"

eval $(thefuck --alias)

# Created by `pipx` on 2026-08-28 20:44:00
export PATH="$PATH:/home/miku/.local/bin"
