
alias lt='ls -tUGnAFoh'
alias ll='ls -lUGnAFoh'
alias gs='git status'
alias gd='git diff'
alias gb='git branch'
alias gc='git checkout'
alias gr='git restore --staged'
alias dc='docker-compose'
alias mc='mutagen-compose'

# ---------------------------------------------- #
#                  Install zinit                 #
# ---------------------------------------------- #

if [[ ! -f "${HOME}/.zinit/bin/zinit.zsh" ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
  mkdir -p "${HOME}/.zinit" && chmod g-rwX "${HOME}/.zinit"
  git clone https://github.com/zdharma-continuum/zinit.git "${HOME}/.zinit/bin" \
    && print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" \
    || print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "${HOME}/.zinit/bin/zinit.zsh"


# ---------------------------------------------- #
#   Plugin zsh-syntax-highlighting
# ---------------------------------------------- #
zinit light zsh-users/zsh-syntax-highlighting

