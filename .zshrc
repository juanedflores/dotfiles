export EDITOR="nvim"

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ghcup
[ -f "/Users/juanedflores/.ghcup/env" ] && source "/Users/juanedflores/.ghcup/env" # ghcup-env
. $HOME/.ghcup/env

# export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home

# luamake
alias luamake=/Users/juanedflores/tools/lua-language-server/3rd/luamake/luamake

# export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# pyenv
export PATH="/Users/juanedflores/.pyenv/bin:$PATH"
# python binaries
export PATH="/Users/juanedflores/Library/Python/3.9/bin:$PATH"
# nvim gui
export PATH="/Users/juanedflores/tools/nvui-macos-x64/bin/:$PATH"
# robodk
export PATH="/Applications/RoboDK/RoboDK.app/Contents/MacOS/:$PATH"
# nvim cli
# export PATH="/Users/juanedflores/tools/nvim-osx64/bin/:$PATH"
# maven
export PATH="/Users/juanedflores/tools/apache-maven-3.8.4/bin/:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# bzip2
export LDFLAGS="-L/opt/homebrew/opt/bzip2/lib"
export CPPFLAGS="-I/opt/homebrew/opt/bzip2/include"

# openssl
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"

# readline
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"

# sqlite
export LDFLAGS="-L/usr/local/opt/sqlite/lib"
export CPPFLAGS="-I/usr/local/opt/sqlite/include"

# zlib
export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"
export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"

# llvm
# export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

alias bs="browser-sync start --no-notify --server --files ."
# alias to love
alias love="/Applications/love.app/Contents/MacOS/love"

export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

bindkey '^n' autosuggest-accept

HISTFILE=~/.cache/zsh_history
HISTSIZE=10000
SAVEHIST=5000
setopt appendhistory
setopt extendedhistory
setopt sharehistory
setopt incappendhistory

ZSH_AUTOSUGGEST_USE_ASYNC="1"

source /Users/juanedflores/tools/zsh-git-prompt/zshrc.sh
source /Users/juanedflores/tools/zsh-autosuggestions/zsh-autosuggestions.zsh
source /Users/juanedflores/tools/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

PROMPT='%F{180}%n%f %~$(git_super_status) % '
