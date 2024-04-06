

# ---------------------------------------------- #
#                  Install zinit                 #
# ---------------------------------------------- #

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# if [[ ! -f "${HOME}/.zinit/bin/zinit.zsh" ]]; then
#   print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
#   mkdir -p "${HOME}/.zinit" && chmod g-rwX "${HOME}/.zinit"
#   git clone https://github.com/zdharma-continuum/zinit.git "${HOME}/.zinit/bin" \
#     && print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" \
#     || print -P "%F{160}▓▒░ The clone has failed.%f%b"
# fi

# source "${HOME}/.zinit/bin/zinit.zsh"


# ---------------------------------------------- #
#   Plugins
# ---------------------------------------------- #
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light paulirish/git-open


# ---------------------------------------------- #
#   Zsh options
# ---------------------------------------------- #
## 他のzshと履歴を共有
setopt inc_append_history
setopt share_history

## パスを直接入力してもcdする
setopt AUTO_CD

# remove trailing spaces after completion if needed
setopt auto_param_keys

# cd コマンドなしでディレクトリ移動
setopt AUTO_CD
cdpath=(.. ~ ~/Development)

# ---------------------------------------------- #
#   Aliases
# ---------------------------------------------- #
alias lt='ls -tUGnAFoh'
alias ll='ls -lUGnAFoh'
alias gs='git status'
alias gd='git diff'
alias gb='git branch'
alias gc='git checkout'
alias gr='git restore --staged'
alias dc='docker-compose'
alias mc='mutagen-compose'
