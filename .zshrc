# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

. "$HOME/.asdf/asdf.sh"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    fast-syntax-highlighting
    history-substring-search
    kubectl
    ansible
    aws
    docker
    docker-compose
    helm
    minikube
    node
    npm
    pip
    python
    redis-cli
    rust
    terraform
    tmux
    zsh-interactive-cd
    zsh-cargo-completion
    golang
    asdf
    fzf-tab
    zsh-fzf-history-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias lg="lazygit"
alias ld="lazydocker"
alias ls="lsd"
alias l="lsd -lt"
alias t="tree"
alias tf="terraform"
alias ex="exit"
alias cat="bat"
alias icat="kitten icat"
alias xclip="xclip -selection c"
alias sctl="systemctl"
alias jctl="journalctl"
alias kdebug="kubectl run test --rm --restart=Never -it --image=ubuntu -- bash"
alias i3config="nvim ~/.config/i3/config"

eval "$(oh-my-posh init zsh --config ~/emodipt-extend.omp.json)"
# eval "$(oh-my-posh init zsh)"

export PATH="$HOME/.asdf/installs/nodejs/20.1.0/bin:/home/hamzaboudouche/.asdf/bin:/home/hamzaboudouche/.cargo/bin/:$HOME/.local/bin:/home/hamzaboudouche/nvim-linux64/bin/:$PATH"

export PATH="$PATH:/usr/local/go/bin"

export PATH="/opt/apache-maven-3.9.5/bin:$PATH"
export PATH="/home/hamzaboudouche/istio-1.20.0/bin:$PATH"

# tmux source ~/.config/tmux/tmux.conf &> /dev/null;

export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
export LIBGL_ALWAYS_INDIRECT=1

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH="/home/hamza/.asdf/installs/java/openjdk-21.0.1/bin/:$PATH"

function vif() {
    local fname
    fname=$(fzf --preview 'cat --style=numbers --color=always {}') || return
    nvim "$fname"
}

export DISPLAY=":0"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export PATH="/home/linuxbrew/.linuxbrew/opt/openjdk@17/bin:$PATH"
export PYTHONPATH="/home/hamza/Downloads/spark-3.5.0-bin-hadoop3/python/lib/py4j-0.10.9.7-src.zip:/home/hamza/Downloads/spark-3.5.0-bin-hadoop3/python/:"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

fortune | cowsay | lolcat

function tmuxattach ()
{
    # if no argument is given: _be mad_
    if [ -z $1 ]; then
        echo "USAGE: tmuxattach <SESSION_NAME>"
        echo "the session will be created if it doesn't exist"
    fi

    # tmux attach to session $1 or create it if it doesn't exist 
    tmux new-session -t $1 > /dev/null 2>&1 || tmux new -s $1 > /dev/null 2>&1 || true
    
}

export -f tmuxattach

# tmux clean up a set of sessions selected from unattached ones 
function tmuxclean ()
{
    tmux ls | rg -v attached | fzf -m | awk '{print $1}' | xargs -I {} tmux kill-session -t {} > /dev/null || true
}

