# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/anhthi/.oh-my-zsh"
export PS1="[%* - %D] %d %% "	
export EDITOR=code
export PAGER=more
export FZF_DEFAULT_OPTS="--height 40% --reverse --preview 'cat {}'"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="/home/anhthi/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/@3rdPartyPackages"
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
zstyle ':bracketed-paste-magic' active-widgets '.self-*'
my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word
DEFAULT_USER=`whoami`
bindkey "^P" up-line-or-search
bindkey "^Y" backward-delete-word 
bindkey "^N" clear-screen
bindkey "^B" kill-word
alias vim='nvim'
alias boom-mem='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head'
alias boom-cpu='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head'
alias lc=colorls
alias yy="~/.scripts/play --volume=100 --autofit=40% --geometry=-20-30 --ytdl --ytdl-format='mp4[height<=?720]' -ytdl-raw-options=playlist-start=1"
alias play='~/.scripts/play --volume=100 --autofit=40% --geometry=-20-30'
 #Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="igeek"
#POWERLEVEL9K_MODE="nerdfont-complete"

#POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="051" # Dark blue
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="232" # Dark blue
#POWERLEVEL9K_STATUS_ERROR_BACKGROUND="009"
#POWERLEVEL9K_STATUS_ERROR_FOREGROUND="231"
#POWERLEVEL9K_TIME_BACKGROUND="190"
#POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
#POWERLEVEL9K_VCS_CLEAN_BACKGROUND='040'
#POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='118'
#POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='197'

POWERLEVEL9K_DISABLE_RPROMPT=true
#POWERLEVEL9K_PROMPT_PREFIX="%{$fg_bold[white]%}➤ "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir vcs)
#HIST_STAMPS="mm/dd/yyyy"
#DISABLE_UPDATE_PROMPT=true
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  zsh-autosuggestions zsh-syntax-highlighting 
  git
)

source $ZSH/oh-my-zsh.sh
source ~/@3rdPartyPackages/zsh-git-prompt/zshrc.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
fpath=($fpath "/home/anhthi/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=246' 
