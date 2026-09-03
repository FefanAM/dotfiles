export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export EDITOR="nvim"
export VISUAL="nvim"

export SSH_AUTH_SOCK="$HOME/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock"

export GPG_TTY=$(tty)

export PATH="$HOME/.local/bin:$PATH"

. "$HOME/.cargo/env"
