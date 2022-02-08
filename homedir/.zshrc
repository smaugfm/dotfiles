# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# append to the history file, don't overwrite it
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

color_prompt=yes
# Prompt goes here
if [ -f ~/.zsh_prompt ]; then
    . ~/.zsh_prompt
fi

#unset color_prompt force_color_prompt

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


export EDITOR=vim
export GOPATH=$HOME/.go

export PATH=$PATH:~/.local/bin:/usr/local/sbin
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
export PATH="/usr/local/anaconda3/bin:$PATH"
export PATH=$PATH:/Applications/kdiff3.app/Contents/MacOS
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$PATH:/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin
export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/31.0.0

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
