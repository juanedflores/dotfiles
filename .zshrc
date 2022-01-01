export EDITOR="nvim"
export VISUAL="$EDITOR"

export PATH="$HOME/nvim-osx64/bin:$PATH"
export PATH="/Applications/CMake.app/Contents/bin":"$PATH"
export PATH="$HOME/apache-maven-3.8.1/bin":"$PATH"
export PATH="$HOME/.local/bin":"$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-16.0.1.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.13.jdk/Contents/Home

# export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:/usr/lib/pkgconfig:/usr/local
# /Homebrew/Library/Homebrew/os/mac/pkgconfig/10.14"
# export PKG_CONFIG_PATH="usr/local/lib/pkgconfig"

export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

GIT_PROMPT_EXECUTABLE="haskell"

# pyenv and pyenv-virtualenv 
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias bs="browser-sync start --no-notify --server --files ."
alias bss="browser-sync start --no-notify --server --files . --index $1"
alias inkscape="/Applications/Inkscape.app/Contents/MacOS/inkscape"

# accept autosuggestion with Ctrl + n
bindkey '^n' autosuggest-accept

HISTFILE=~/.cache/zsh_history
HISTSIZE=10000
SAVEHIST=5000
setopt appendhistory
setopt extendedhistory
setopt sharehistory
setopt incappendhistory

ZSH_AUTOSUGGEST_USE_ASYNC="1"

source /Users/juaneduardoflores/.zsh/zsh-git-prompt/zshrc.sh
source /Users/juaneduardoflores/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /Users/juaneduardoflores/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

PROMPT='%F{180}%n%f %~$(git_super_status) % '
. $HOME/.ghcup/env
