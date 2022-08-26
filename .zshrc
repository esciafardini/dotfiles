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
 export EDITOR="nvim"

#configuration
 alias zcfg="nvim ~/.zshrc"
 alias vcfg="cd ~/.config/nvim"
 alias gcfg="nvim ~/.gitconfig"
 alias omzcfg="nvim ~/.oh-my-zsh"

#aclaimant
 alias acl="cd ~/dev/aclaimant && . ./Envfile && cd acl"
 alias logtail="docker compose logs --tail=200 -f"
 alias restore="pg-s3-download staging && pg-restore -s crvn -s ffx -s globo -s qa -s qav3 -s landv3 -s r3coll staging"
 alias coop="lein do clean, cooper"
 alias mig="lein migrations migrate"
 alias destroy="docker compose stop && docker compose rm"
 alias rebuild="docker compose up --build"

#terminal shortcuts
 alias pln="lsof -i $1"

#projects
 alias hotline="cd ~/Projects/twilio-hotline"
 alias blogg="cd ~/Projects/clj-blog"
 alias intro="cd ~/Tutorials/Clojure-Intro/src/introduction_to_clojure"

newtabi(){
  osascript \
    -e 'tell application "iTerm2" to tell current window to set newWindow to (create tab with default profile)'\
    -e "tell application \"iTerm2\" to tell current session of newWindow to write text \"${@}\""
}

# 4clj() {
#     newtabi 'cd ~/four_clojure/src/four_clojure && lein repl'
#     wait
#     newtabi 'cd ~/four_clojure/src/four_clojure && nvim core.clj'
# }
#
 alias 4clj="cd ~/four_clojure/src/four_clojure"
 alias psqlt="psql -U remote-dev -p 9067 ted"
 # must specify DB name 'ted' bc aclaimant hijacked my defaults

# Oh My Zsh
 source $ZSH/oh-my-zsh.sh

 #Scripts
 export PATH="$HOME/scripts:$PATH"


# JENV JUNK
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
eval export PATH="/Users/remote-dev/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
source '/opt/homebrew/Cellar/jenv/0.5.4/libexec/libexec/../completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv refresh-plugins
jenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}


# Reverse Index Mod
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
