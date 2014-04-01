export ZSH=~/.zsh

PATH=/usr/local/share/pypy:/usr/local/bin:/usr/local/sbin:$PATH
fpath=($HOME/.zsh/functions $fpath)

autoload -Uz beer

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load and run compinit
autoload -U compinit
compinit -i
