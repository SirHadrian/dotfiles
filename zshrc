# Included first to eliminate the color scheme change flash
# Terminal Color Scheme from PyWal
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
#cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

#ZSH_THEME="robbyrussell"
ZSH_THEME=powerlevel10k/powerlevel10k

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
ENABLE_CORRECTION="true"

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
plugins=(git zsh-syntax-highlighting zsh-autosuggestions autojump)

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# # Aliases
#
# Terminal
alias ..='cd ..'
alias ...='cd ../..'
alias ls='exa'
alias l='exa -l'
alias la='exa -la'
alias lr='exa -lR'
alias ra='ranger'
alias cat='bat'
#alias vs='vscodium . ; exit'
alias f='xdg-open "$(fzf)" &> /dev/null'

# HDMI monitor
alias start-HDMI='xrandr --output HDMI-1-0 --mode 1366x768 --auto --right-of eDP-1 && sleep 2 && leftwm command SoftReload'
alias stop-HDMI='xrandr --output HDMI-1-0 --off && sleep 2 && leftwm command SoftReload'

# General settings
alias noblackscreen='xset s off && xset -dpms'

# Live wallpaper
alias animvid-gpu='prime-run xwinwrap -g 1920x1080 -ov -ni -s -nf -un -fs -b -- mpv --hwdec=vdpau --vo=gpu -wid WID --loop --no-border --no-config --no-window-dragging --no-input-default-bindings --no-osd-bar --no-sub --no-audio'

# Bluetooth headset
#alias conheadset='bluetoothctl connect 00:18:09:FE:CC:7F'
#alias disconheadset='bluetoothctl connect 00:18:09:FE:CC:7F'

# Systemctl
alias sc='sudo systemctl'

# # General Utils
makedir(){
    mkdir -p "$1" && cd "$1"
}

trash(){
    [[ ! -d ~/.Trash ]] && mkdir ~/.Trash
    mv "$@" ~/.Trash
}

# # extract - archive extractor
# # usage: extract <file>
extract ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar -xjvf $1   ;;
            *.tar.gz)    tar -xzvf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar -xvf $1    ;;
            *.tbz2)      tar -xjvf $1   ;;
            *.tgz)       tar -xzvf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# # Git Utils
# Aliases
alias gst='git status'

# Functions
gcom(){
    git add .
    git commit
}

# Neovide
nv(){
  neovide --multigrid $1
  exit
}

# Exec command in background
p(){
    "$@" &> /dev/null &
}

# Move file to Trash
t(){
    [[ -d ~/Trash ]] || mkdir ~/Trash
    mv "$1" ~/Trash
}

# Always open zsh menu on tab
zstyle ':completion:::::default' menu yes select
# Autotab complete
# Show hidden files
#_comp_options+=(globdots)		# Include hidden files.

# Ranger keep last visited directory
racd () {
    tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    if [[ -f "$tmp" ]]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [[ -d "$dir" ]] && [[ "$dir" != "$(pwd)" ]] && cd "$dir"
    fi
}

# Keybinds
bindkey -s '^o' 'racd\n' # ranger
bindkey -s '^p' 'cmus\n' # cmus
bindkey -s '^h' 'htop\n' # htop
bindkey -s '^f' 'xdg-open "$(fzf)" &> /dev/null\n'  # file search

# Path
export PATH="$HOME/.cargo/bin:$PATH"

# Editor
export EDITOR='nvim'
