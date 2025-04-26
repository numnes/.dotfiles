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

alias start="pnpm start"
alias build="pnpm build"
alias dev="pnpm dev"
alias as="smug as"
alias es="smug es"
alias nclear="rm -rf node_modules"
alias gipull="git pull"
alias gic="git checkout"
alias gip="git push"
alias gis="git status"
alias gi.="git checkout ."
alias gicm="git commit -m"
alias gia="git add ."
alias gipu="git push --set-upstream origin"
alias gicb="git checkout -b"
alias pn="pnpm"
alias nv="nvim ."
alias szsh="source ~/.zshrc"
alias idea="bash ~/intellij/idea-IU-233.13135.103/bin/idea.sh &>/dev/null &"
alias nvcacheclear="rm -rf ~/.cache/nvim"
alias neofetch="neofetch --source /home/operador/logoso.txt"
alias zcl="rm ~/.cache/zsh_prompt_versions"

#####  Prompt informations
CACHE_FILE="$HOME/.cache/zsh_prompt_versions"
CACHE_TTL=30

prompt_context() {
  local now=$(date +%s)
  local cached=0
  local node_version=""
  local pnpm_version=""
  local time=$(date +'%H:%M:%S')

  if [[ -f "$CACHE_FILE" ]]; then
    source "$CACHE_FILE"
    if (( now - PROMPT_CACHE_TIMESTAMP < CACHE_TTL )); then
      cached=1
    fi
  fi

  if (( cached == 0 )); then
    node_version=$(node --version | sed -e "s/v//g")
    pnpm_version=$(pnpm --version)
    PROMPT_CACHE_TIMESTAMP=$now

    mkdir -p ~/.cache
    cat <<EOF > "$CACHE_FILE"
PROMPT_CACHE_TIMESTAMP=$PROMPT_CACHE_TIMESTAMP
node_version="$node_version"
pnpm_version="$pnpm_version"
EOF
  fi

  prompt_segment white blue "🎂"
  prompt_segment cyan black "🕒 $time"
  prompt_segment black green " $node_version"
  prompt_segment green black "pnpm $pnpm_version"
}
####################

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

# Set up fzf key bindings and fuzzy completion

eval "$(atuin init zsh --disable-up-arrow)"

# >>> xmake >>>
test -f "/home/operador/.xmake/profile" && source "/home/operador/.xmake/profile"
# <<< xmake <<<


# add Pulumi to the PATH
export PATH=$PATH:/home/operador/.pulumi/bin


# bun completions
[ -s "/home/operador/.bun/_bun" ] && source "/home/operador/.bun/_bun"

