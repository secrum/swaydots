### ZSH SECRUM ###

export ZSH="$HOME/.oh-my-zsh"

# OMZ Plugins
plugins=(git dnf vi-mode)


# Aliases
  alias cat='bat --style=plain'
  alias dnf='sudo dnf'

# PATH
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

export PATH
# Editor
export EDITOR="nvim"
export VISUAL="nvim"

#OMZ sourced script
source $ZSH/oh-my-zsh.sh

#Starship prompt init
eval "$(starship init zsh)"

