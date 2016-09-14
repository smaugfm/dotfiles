# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias igrep='grep -i --color=auto'
fi

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# Make mc preserve directory upon exit
alias mc='. /usr/share/mc/bin/mc-wrapper.sh '

# git aliases
alias gs='git status '
alias gr='git reset '
alias gp='git pull '
alias ga='git add '
alias gb='git branch '
alias gc='git commit '
alias gd='git diff '
alias gds='git diff --stat '
alias gdc='git diff --cached '
alias gco='git checkout ' 
alias gh='git h '
alias gha='git ha '
alias ght='git ht '
alias ghat='git hat '
alias ghme='git h | grep -E "$(git config user.name)|$" --color '
alias ghtme='git ht | grep -E "$(git config user.name)|$" --color '

