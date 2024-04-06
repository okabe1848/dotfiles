# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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


# ripgrrep
if [ "$(uname -i)" = "aarch64" ]; then
  zinit ice from"gh-r" as"program" bpick"*aarch64-unknown-linux-gnu*" pick"rg"
  zinit light microsoft/ripgrep-prebuilt
elif [ "$OSTYPE" =~ "darwin" ]; then
  zinit ice from"gh-r" as"program" bpick"*apple-darwin*" pick"rg"
  zinit light microsoft/ripgrep-prebuilt
fi

# ---------------------------------------------- #
#   Update zinit
# ---------------------------------------------- #
zinit self-update
zinit update --parallel

# ---------------------------------------------- #
#   Zsh options
# ---------------------------------------------- #
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

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


# --------------------- #
#  　peco settings
# --------------------- #
function peco-history-selection() {
    BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection


# cdr
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
    zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi

function peco-cdr () {
    local selected_dir="$(cdr -l | sed 's/^[0-9]\+ \+//' | peco --prompt="cdr >" --query "$LBUFFER")"
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}
zle -N peco-cdr
bindkey '^E' peco-cdr


## カレントディレクトリ以下のディレクトリ検索・移動
function find_cd() {
  local selected_dir=$(find . -type d | peco)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
}
zle -N find_cd
bindkey '^X' find_cd

# ---------------------------------------------- #
#   Aliases
# ---------------------------------------------- #
alias lt='ls -tUGnAFoh'
alias ll='ls -lvGnAFoh'
alias gs='git status'
alias gd='git diff'
alias gb='git branch'
alias gc='git checkout'
alias gr='git restore --staged'
alias dc='docker-compose'
alias mc='mutagen-compose'

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
