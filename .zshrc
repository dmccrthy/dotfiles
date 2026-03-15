# === General Config ===

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="lukerandall"

# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="false"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git nvm zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# === User configuration / Aliases ===

# Update java JDK version
alias java-version="sudo update-alternatives --config java"

# Remember how to set remote url
alias git-remote="echo 'git remote set-url origin git@github.com:username/your-repository.git'"

# === Development ===

# Add Gradle to path
export PATH=$PATH:/opt/gradle/gradle-9.1.0/bin

# Add golang to path
export PATH=$PATH:/usr/local/go/bin

# Node version manager
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/danmc/.zsh/completions:"* ]]; then export FPATH="/home/danmc/.zsh/completions:$FPATH"; fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# bun completions
[ -s "/home/danmc/.bun/_bun" ] && source "/home/danmc/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
. "/home/danmc/.deno/env"

# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit