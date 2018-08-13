# Path to your oh-my-zsh installation.
  export ZSH=/home/liulong/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
plugins=(git)

# User configuration

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
source ~/.profile

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ssh_7="ssh liulong@192.168.6.7"
alias ssh_65="ssh Liu_Long@192.168.6.65"
alias ssh_153="ssh web@192.168.6.153"
alias ssh_155="ssh liulong@192.168.6.155 -p 33312"
alias ssh_149="ssh liulong@192.168.6.149 -p 33312"
alias ssh_142="ssh Liu_Long@192.168.6.142 -p 33312"
alias ssh_143="ssh Liu_Long@192.168.6.143 -p 33312"
alias ssh_228="ssh root@192.168.6.228"
alias ssh_quyue="ssh root@120.27.227.83 -p 33312"
alias ssh_51="ssh root@192.168.6.51"
alias ssh_182="ssh web@192.168.6.182"
alias ssh_21="ssh Liu_Long@192.168.6.21"
alias ssh_78="ssh Liu_Long@192.168.6.78 -p 33312"
alias ssh_79="ssh Liu_Long@192.168.6.79 -p 33312"
alias ssh_abroad="ssh Liu_Long@52.74.75.219"
alias m5="~/work/common_shell/m5.sh"
alias ssh_yunroot="ssh root@39.106.122.221"
alias ssh_yunweb="ssh web@39.106.122.221"
alias ssh_resuser="ssh res_user@119.28.62.145"
alias vpn="/bin/sh ~/project/common_shell/openvpn.sh"
