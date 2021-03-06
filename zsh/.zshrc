export EDITOR="nvim"
export VISUAL="$EDITOR"
export JAVA_HOME="$(/usr/libexec/java_home)"
# export PATH="$HOME/apache-maven-3.6.3/bin:$PATH"
# export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
# export PATH="/Library/TeX/texbin/:$PATH"
export PATH="/Users/juaneduardoflores/.nvm/versions/node/v10.13.0/bin:/Users/juaneduardoflores/.cabal/bin:/Users/juaneduardoflores/.ghcup/bin:/Users/juaneduardoflores/.pyenv/plugins/pyenv-virtualenv/shims:/Users/juaneduardoflores/.pyenv/shims:/Users/juaneduardoflores/.pyenv/bin:/Library/TeX/texbin/:/usr/local/opt/grep/libexec/gnubin:/Users/juaneduardoflores/apache-maven-3.6.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/Applications/kitty.app/Contents/MacOS"
export PATH="/Users/juaneduardoflores/.nvm/versions/node/v10.13.0/bin/node:$PATH"
export PATH="/Users/juaneduardoflores/.local/bin:$PATH"
export PATH="/Users/juaneduardoflores/nvim-osx64/bin:$PATH"
# export PATH="/usr/local/Cellar/task/2.5.1/:$PATH"

export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

GIT_PROMPT_EXECUTABLE="haskell"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

PIPENV_VENV_IN_PROJECT=1

alias bs="browser-sync start --no-notify --server --files ."
alias ps3="mvn archetype:generate -DarchetypeGroupId="com.juaned" -DarchetypeArtifactId="Processing3" -DarchetypeVersion="1.0-SNAPSHOT""
alias flk= "flok-repl -H wss://flok-hub.herokuapp.com -s Nzg0NjlmMjEtNzE5Zi00M2ZhLWI5NzUtNjdjOTk1M2UyMzYw -t tidal --extra '{ "bootScript": "/Users/juaneduardoflores//.cabal/store/ghc-8.8.4/tdl-1.6.1-3593a318/share/BootTidal.hs" }' -N Juan"

convertMDtoHTMLDir() {
  if [ "$1" != "" ] 
  then 
    pandoc "$1".md --highlight-style=tango --template=/Users/juaneduardoflores/.pandoc/templates/ukit/standalone.html -o "$1".html --toc --toc-depth=4 && mv "$1".html "$2"/"$1"
  else
    echo "didn't work"
  fi
}

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

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
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
