export ZSH=~/.zsh
export REACT_EDITOR=code

# M1 Mac Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

PATH=/usr/local/share/pypy:/usr/local/bin:/usr/local/sbin:$PATH
fpath=($HOME/.zsh/functions /usr/local/share/zsh-completions $fpath)

GOPATH=$HOME/go

autoload -Uz beer

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/zsh-history-substring-search/zsh-history-substring-search.zsh

# Load and run compinit
autoload -U compinit
compinit -i
