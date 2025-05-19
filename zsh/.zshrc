#bindkey "^I" expand-or-complete
#Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
# Source Colors from Dots
source ~/.config/zshrc.d/dots-hyprland.zsh
# Adding Starship
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

#Used to Remove duplication of the first 2 letters
#run locale -a to find what LC_CTYPE should = To
export LC_CTYPE=C.utf8

# Plugins
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Snippets
zinit snippet OMZP::command-not-found
zinit snippet OMZP::archlinux
zinit snippet OMZP::sudo
zinit snippet OMZP::git

# Load completions
autoload -U compinit && compinit
zinit cdreplay -q

# Keybindings
#bindkey "^[[Z" fzf-tab-complete
bindkey "^ " autosuggest-accept #Shift Tab
bindkey "^[[Z" autosuggest-accept #Shift Tab
bindkey '^[[A' history-search-backward #Up Arrow
bindkey '^[[B' history-search-forward #Down Arrow

# Adding History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Completion Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "{(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
#zstyle ':fzf-tab:*' fzf-bindings 'tab:accept'

#eval imports
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

#Aliases
alias ls='eza --color --icons -F'
alias ip='ip -color=auto'
alias setup='bash -c "$(curl -fsSL https://raw.githubusercontent.com/TriforceGB/Anisble_Setup/main/Scripts/Pre-Ansible.sh)"'
alias fastfetch=fastfetch
alias neofetch=fastfetch
alias fetch=fastfetch
alias vim=nvim

# Boot Commands
neofetch #Probably will make small and custom for boot