export EDITOR="nvim"
export VISUAL="$EDITOR"
export JAVA_HOME="$(/usr/libexec/java_home)"
export PATH="$HOME/apache-maven-3.6.3/bin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

GIT_PROMPT_EXECUTABLE="haskell"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi


alias bs="browser-sync start --no-notify --server --files ."
alias ps3="mvn archetype:generate -DarchetypeGroupId="com.juaned" -DarchetypeArtifactId="Processing3" -DarchetypeVersion="1.0-SNAPSHOT""

convertMDtoHTMLDir() {
  if [ "$1" != "" ] 
  then 
    pandoc "$1".md --highlight-style=tango --template=/Users/juaneduardoflores/.pandoc/templates/ukit/standalone.html -o "$1".html --toc --toc-depth=4 && mv "$1".html "$2"/"$1"
  else
    echo "didn't work"
  fi
}

# [ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# . $HOME/.ghcup/env

bindkey '^n' autosuggest-accept

HISTFILE=~/.cache/zsh_history
HISTSIZE=50000
SAVEHIST=10000
setopt appendhistory
setopt extendedhistory
setopt sharehistory
setopt incappendhistory
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /Users/juaneduardoflores/.zsh/zsh-git-prompt/zshrc.sh
source /Users/juaneduardoflores/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /Users/juaneduardoflores/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


PROMPT='%F{180}%n%f %~$(git_super_status) % '
