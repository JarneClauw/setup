#!/usr/bin/env zsh

#### PLUGIN MANAGER ####
function add_file() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

function add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
	add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh" || \
	add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
    else
        git clone --depth 1 "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}

#### OPTIONS ####
setopt HIST_FIND_NO_DUPS

#### ALIASES ####
alias ls="lsd"
alias ll="lsd -l"
alias la="lsd -la"
alias vim="nvim"

#### KEYBINDS ####
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

#### PLUGINS ####
add_plugin "zsh-users/zsh-autosuggestions"
add_plugin "zsh-users/zsh-completions"
add_plugin "zsh-users/zsh-history-substring-search"
add_plugin "zsh-users/zsh-syntax-highlighting"

#### STARSHIP ####
eval "$(starship init zsh)"

#### DIRENV ####
eval "$(direnv hook zsh)"

