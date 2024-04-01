# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

# aliases
source $HOME/.config/.zsh_profile

function nvims() {
  items=("default" "AstroVim" "LazyVim" "NvChad")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt="Neovim Config >> " --height=~50% --layout=reverse --border --exit-0)

  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config = ""
  fi
  NVIM_APPNAME=$config nvim $@
}

# oh-my-zsh plugins
plugins=(
    git
    direnv
    dotenv
    python
    web-search
    aliases
    encode64
    tmux
    vi-mode
    zsh-autosuggestions
    zsh-syntax-highlighting
  )

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# required for pipx & poetry
export PATH="$HOME/.local/bin:$PATH"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # fzf

# Created by `pipx` on 2023-03-01 08:29:34
export PATH="$PATH:/Users/dkKirSwe/.local/bin"

# Change the current directory for a tmux session, which determines
# the starting dir for new windows/panes:
function tmux-cwd {
    tmux command-prompt -I $PWD -P "New session dir:" "attach -c %1"
}

# Azure CLI autocompletions
[ -f /opt/homebrew/etc/bash_completion.d/az ] && source /opt/homebrew/etc/bash_completion.d/az

# Zellij autostart on terminal (disabled as tmux seems better still)
# eval "$(zellij setup --generate-auto-start zsh)"

# init homebrew if exists
[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Created by `pipx` on 2023-03-01 08:29:34
export PATH="$PATH:/Users/dkKirSwe/.local/bin"


# ~/.tmux/plugins
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
# ~/.config/tmux/plugins
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH



# JINA_CLI_BEGIN

## autocomplete
if [[ ! -o interactive ]]; then
    return
fi

compctl -K _jina jina

_jina() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(jina commands)"
  else
    completions="$(jina completions ${words[2,-2]})"
  fi

  reply=(${(ps:
:)completions})
}

# session-wise fix
ulimit -n 4096
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# JINA_CLI_END


# SAML2AWS
alias saml2aws-sandbox="saml2aws login --profile lego-databricks-academy-sandbox:Admin --force --skip-prompt"

# function create_saml2aws_aliases()
# {
#   local config_file="$HOME/.saml2aws"
# 
#   # check if config file exists
#   if [ -f "$config_file" ]; then
#     while IFS = read -r line; do
#       # check if line encased in [ ]
#       if [[ $line == *\]* ]]; then
#         # extract config name
#         config_name = $(echo "$line" | sed 's/\[\(.*\)\]/\1/')
#         # create alias for config
#         alias saml2aws-$config_name="saml2aws login --profile $config_name --force --skip-prompt"
#       fi
#     done < "$config_file"
#   fi
# }
# 
# create_saml2aws_aliases

export AWS_PROFILE=default
export AWS_DEFAULT_REGION=eu-west-1
export AWS_REGION=$AWS_DEFAULT_REGION
export SAML2AWS_REGION=$AWS_DEFAULT_REGION
eval "$(saml2aws --completion-script-zsh)"


autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# initiate mise
eval "$(~/.local/bin/mise activate zsh)"

# stuff needed for ruby to work
export RUBY_YJIT_ENABLE=1
export RUBY_CONFIGURE_OPTS="--with-zlib-dir=$(brew --prefix zlib) --with-openssl-dir=$(brew --prefix openssl@1.1) --with-readline-dir=$(brew --prefix readline) --with-libyaml-dir=$(brew --prefix libyaml) --with-gdbm-dir=$(brew --prefix gdbm)"
export CFLAGS="-Wno-error=implicit-function-declaration"
export LDFLAGS="-L$(brew --prefix libyaml)/lib"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# zoxide
eval $(zoxide init zsh)
