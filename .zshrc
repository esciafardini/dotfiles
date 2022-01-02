# Path to your oh-my-zsh installation.
 export ZSH="/Users/remote-dev/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
 ZSH_THEME="wezm"

# just remind me to update when it's time to update oh-my-zsh
 zstyle ':omz:update' mode reminder  

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

##Aliases
#editors
 alias neovide="~/neovide/target/release/neovide"
 alias vim="nvim"
 alias vimgui="neovide"
 alias emacsd="emacs --daemon"
 alias killemacs="emacsclient -e \"(kill-emacs)\""
 export EDITOR="emacs"

#configuration
 alias zcfg="emacs ~/.zshrc"
 alias vcfg="emacs ~/.config/nvim/init.vim"
 alias ecfg="emacs ~/.emacs.d/personal/custom.el"
 alias omzcfg="emacs ~/.oh-my-zsh"

#aclaimant
 alias acl="cd ~/dev/aclaimant && . ./Envfile && cd acl"
 alias logtail="docker compose logs --tail=200 -f"

#terminal shortcuts
 alias pln="lsof -i $1"

#projects
 alias hotline="cd ~/Projects/twilio-hotline"
 alias intro="cd ~/Tutorials/Clojure-Intro/src/introduction_to_clojure"

# Oh My Zsh
 source $ZSH/oh-my-zsh.sh
