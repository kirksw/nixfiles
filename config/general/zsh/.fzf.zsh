# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/dkKirSwe/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/dkKirSwe/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/dkKirSwe/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/dkKirSwe/.fzf/shell/key-bindings.zsh"
