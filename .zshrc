# Add user configurations here
# For HyDE not to touch your beloved configurations,
# we added 2 files to the project structure:
# 1. ~/.hyde.zshrc - for customizing the shell related hyde configurations
# 2. ~/.zshenv - for updating the zsh environment variables handled by HyDE // this will be modified across updates

#  Plugins 
# oh-my-zsh plugins are loaded  in ~/.hyde.zshrc file, see the file for more information

#  Aliases 
# Add aliases here
# # Directory navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias lazyman='bash ~/.config/kittypadding.sh'
alias hx='helix'
alias home='cd ~/'
alias proj='cd ~/Projects'
alias docs='cd ~/Documents'
alias down='cd ~/Downloads'
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ls='eza --icons=auto --tree -L=1'
alias dir='ls --group-directories-first'    
alias lg='lazygit'
#  This is your file 
# Add your configurations here
if command -v zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
fi

export PATH=$PATH:/usr/local/go/bin
GOPATH=$HOME/go  PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
