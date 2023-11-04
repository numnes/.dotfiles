export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
plugins=(
    git
    sudo
    zsh-autosuggestions
    zsh-completions
)

source $ZSH/oh-my-zsh.sh

alias start="yarn start"
alias build="yarn build"
alias test="yarn test"
alias dev="yarn dev"
alias as="smug as"
alias es="smug es"
alias nclear="rm -rf node_modules"

#####  Prompt informations
prompt_context() {
  local npmVersion=`npm --version`
  local nodeVersion=`node --version | sed -e "s/v//g"`
  prompt_segment white blue ""
  prompt_segment black green  " $nodeVersion"
  prompt_segment green black  " $npmVersion"
}
#####  Prompt informations

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
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
add-zsh-hook chpwd load-nvmrc
load-nvmrc


[[ $COLORTERM =~ ^(truecolor|24bit)$ ]]

export PATH="$PATH:$HOME/.local/bin"

export ANDROID_HOME="~/Android/Sdk"
eval "$(github-copilot-cli alias -- "$0")"

if [ "$TMUX" = "" ]; then tmux; fi
