# zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# Path to your Oh My Zsh installation.
export ZSH="/home/wjh/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="spaceship"
# POWERLEVEL9K_MODE="awesome-patched"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

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
export SPACESHIP_DIR_TRUNC=3
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
    zsh-syntax-highlighting
    zsh-autosuggestions
    # zsh-completions
    conda-zsh-completion
    pip
    sudo
    command-not-found
    extract
)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/wjh/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/wjh/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/wjh/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/wjh/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup


# export HF_ENDPOINT=https://hf-mirror.com
export HF_ENDPOINT="https://hf-mirror.com"
alias p='pwd'
alias nas='cd /nasdata/wjh/'
alias conda_env='conda env list'
alias tmux_mouse=''
alias pin='pip install'
alias env_init='conda activate vidto4d'
alias lnums='ls | wc -l'
alias tat='tmux a -t'
# 输入文件夹时直接cd到该文件夹，输入文件路径时直接cd到该文件所在的路径下
function ccd() {
    if [ "$1" = "-" ]; then
        builtin cd -
    elif [ -d "$1" ]; then
        builtin cd "$1"
    elif [ -f "$1" ]; then
        builtin cd "$(dirname "$1")"
    else
        echo "cd: $1: not a dir"
    fi
}


# env_init
# 可以设置：ALL_PROXY='${hostip}:${http_hostport}'
alias clash='/home/wjh/clash/clash -f config.yaml' # config yaml 可以从本地上传
# export hostip=172.18.80.1
export hostip=127.0.0.1
# export socks_hostport=4740 # clash默认为7890
export http_hostport=7893
alias proxyon='
    export https_proxy="https://${hostip}:${http_hostport}"
    export http_proxy="http://${hostip}:${http_hostport}"
'
alias socks_proxyon='
    export ALL_PROXY="socks5://${hostip}:${http_hostport}"
    export all_proxy="socks5://${hostip}:${http_hostport}"
'
alias proxyoff='
    unset https_proxy
    unset http_proxy
    unset ALL_PROXY
    unset all_proxy
'
# alias socks_proxyoff='
# '
alias proxyecho='
    echo $https_proxy
    echo $http_proxy
    echo $ALL_PROXY
    echo $all_proxy
'    
# alias socks_proxyecho='
# '

# alias cuda11='
#     export PATH="/home/wjh/cuda-11.1/bin:$PATH"
#     export LD_LIBRARY_PATH="/home/wjh/cuda-11.1/lib64:$LD_LIBRARY_PATH"
# '
# alias cuda10='
#     export PATH="/home/wjh/cuda-10.2/bin:$PATH"
#     export LD_LIBRARY_PATH="/home/wjh/cuda-10.2/lib64:$LD_LIBRARY_PATH"
# '
# switch git proxy
function git_proxy_on() {
    git config --global http.proxy "http://${hostip}:${http_hostport}"
    git config --global https.proxy "https://${hostip}:${http_hostport}"
    echo "Git proxy enabled."
}
function git_proxy_off() {
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    echo "Git proxy disabled."
}
function git_proxy_echo() {
    echo "http.proxy: $(git config --global --get http.proxy)"
    echo "https.proxy: $(git config --global --get https.proxy)"
}

# 可以使用x来解压缩任何类型的压缩文件
# zprof

# export CUDA_HOME="/home/wjh/cuda"
# export PATH="$CUDA_HOME/bin:$PATH"
# export LD_LIBRARY_PATH="$CUDA_HOME/lib64:$LD_LIBRARY_PATH"
# cuda version
# alias cuda='
#     export CUDA_HOME=/home/wjh/cuda
#     export PATH=$CUDA_HOME/bin:$PATH
#     export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
# '
# alias disable_cuda='
#     unset PATH
#     unset LD_LIBRARY_PATH
# '
# export CUDA_HOME=/usr/local/cuda
# export PATH=$CUDA_HOME/bin:$PATH
# export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
export PATH=/usr/local/cuda/bin:$PATH
alias tosutil='/home/wjh/tools/tosutil'

function hf_model(){ # $1 是model名字，$2是localdir
    huggingface-cli download --resume-download $1 --local-dir $2 --local-dir-use-symlinks False

}
function hf_dataset(){ # $1 是dataset名字，$2是localdir
    huggingface-cli download --resume-download --repo-type dataset $1 --local-dir $2 --local-dir-use-symlinks False
}