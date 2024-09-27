export NVM_LAZY=1

#alias cat="/opt/homebrew/bin/bat"
alias du="/opt/homebrew/bin/dust"
alias df="/opt/homebrew/bin/duf"
# alias find="/opt/homebrew/bin/fd"
alias ls="/opt/homebrew/bin/exa -lah"
alias uuid="uuid v4 10"
alias guid="uuid v4 10"
alias dev=staging
alias cod="cd ~/code/"
alias root='cd $(git rev-parse --show-toplevel)'
alias gs='git status'

eval "$(starship init zsh)"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug 'wfxr/forgit'
zplug load

source ~/code/noncf/fzf-tab/fzf-tab.plugin.zsh
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

eval "$(mcfly init zsh)"

# nvm auto-switching
# place this after nvm initialization!
# autoload -U add-zsh-hook

# load-nvmrc() {
#   local nvmrc_path
#   nvmrc_path="$(nvm_find_nvmrc)"

#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version
#     nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
#       nvm use
#     fi
#   elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }

# add-zsh-hook chpwd load-nvmrc
# load-nvmrc