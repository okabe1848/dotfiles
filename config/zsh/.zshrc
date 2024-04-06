# ---------------------------------------------- #
#                  Install zinit                 #
# ---------------------------------------------- #
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# ---------------------------------------------- #
#   Plugins
# ---------------------------------------------- #
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light paulirish/git-open

# bat
# 使い方: https://qiita.com/t_o_d/items/d3799294a6a935f78f8f
zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

# 以下はただのエイリアス設定
if builtin command -v bat > /dev/null; then
  alias cat="bat"
fi

# Load powerlevel10k theme
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k
# source "$XDG_CONFIG_HOME/zsh/.p10k.zsh"

# Load the pure theme, with zsh-async library that's bundled with it.
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# ---------------------------------------------- #
#   Update zinit
# ---------------------------------------------- #
zinit self-update
zinit update --parallel

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
