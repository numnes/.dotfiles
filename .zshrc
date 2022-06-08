export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
plugins=(
    git
    sudo
    zsh-autosuggestions
    wakatime
)

source $ZSH/oh-my-zsh.sh

alias zshconf="code ~/.zshrc"
alias zshupdate="source ~/.zshrc"
alias cl="clear"
alias nv="nvim"
alias run="yarn start"

prompt_context() {
  prompt_segment cyan default "💻"
}

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[[ $COLORTERM =~ ^(truecolor|24bit)$ ]]
