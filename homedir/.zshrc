# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# append to the history file, don't overwrite it
HISTSIZE=100000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history       #Where to save history to disk
SAVEHIST=1000000              #Number of history entries to save to disk
#HISTDUP=erase                #Erase duplicates in the history file
setopt    appendhistory       #Append history to the history file (no overwriting)
setopt    sharehistory        #Share history across terminals
setopt    incappendhistory    #Immediately append to the history file, not just when a term is killed

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

eval "$(/opt/homebrew/bin/brew shellenv)"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

export EDITOR=vim
export GOPATH=$HOME/.go

export PATH=$PATH:~/.local/bin:/usr/local/sbin
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$PATH:/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin
export FZF_DEFAULT_COMMAND='ag -l --path-to-ignore ~/.agignore --nocolor --hidden -g ""'
export FZF_DEFAULT_OPTS="
--height 80% 
--preview '([[ -f {} ]] && (bat --style=numbers --color=always --line-range=:500 {} || cat {})) || ([[ -d {} ]] && (tree -C {} || ls {}) || echo {} 2> /dev/null | head -200)'
"
export FZF_CTRL_T_OPTS="
--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
--bind 'ctrl-/:toggle-preview' 
--bind 'enter:become(vim {})'
"
source <(fzf --zsh)
