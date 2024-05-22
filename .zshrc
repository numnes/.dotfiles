export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
plugins=(
    git
    sudo
    zsh-autosuggestions
    zsh-completions
    zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh
# source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $ZSH/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

alias start="yarn start"
alias build="yarn build"
alias test="yarn test"
alias dev="yarn dev"
alias as="smug as"
alias es="smug es"
alias nclear="rm -rf node_modules"
alias gip="git push"
alias gis="git status"
alias gicm="git commit -m"
alias gia="git add ."
alias gipu="git push --set-upstream origin"
alias gicb="git checkout -b"
alias nv="nvim ."

#####  Prompt informations
prompt_context() {
  local npmVersion=`pnpm --version`
  local nodeVersion=`node --version | sed -e "s/v//g"`
  prompt_segment white blue ""
  prompt_segment black green  " $nodeVersion"
  prompt_segment green black  "pnpm $npmVersion"
}
#####  Prompt informations

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}


# ===== ASDF
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit


[[ $COLORTERM =~ ^(truecolor|24bit)$ ]]

export PATH="$PATH:$HOME/.local/bin"

export ANDROID_HOME="/home/operador/Android/Sdk"

if [ "$TMUX" = "" ]; then tmux; fi

# pnpm
export PNPM_HOME="/home/operador/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export GPG_TTY=$(tty)

# CONSTS 
export $(asdf env java | grep JAVA_HOME)
export GRADLE_SIGNATURE_CHECK=no

eval "$(atuin init zsh --disable-up-arrow)"

# >>> xmake >>>
test -f "/home/operador/.xmake/profile" && source "/home/operador/.xmake/profile"
# <<< xmake <<<