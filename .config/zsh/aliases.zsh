alias ls='eza --icons auto'

alias ll='eza -lh --icons auto'

alias la='eza -lah --icons --git'

alias tree='eza --tree --icons auto'

compdef eza=ls

alias cr='cargo run'

alias venv='source venv/bin/activate'

# ---------- flatpak ---------

alias zen='flatpak run app.zen_browser.zen'
alias fluxer='flatpak run app.fluxer.Fluxer'
