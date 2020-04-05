# [Environment Variables]
# 基本的な環境変数を設定する
export LANG=ja_JP.UTF-8
export TERM=xterm-256color
export EDITOR=vim
export LSCOLORS=cxfxbxdxbxegedabagabad
HISTSIZE=10000000
SAVEHIST=10000000
DISABLE_AUTO_TITLE=true  # Window のタイトルを自動で更新しない

# 設定ファイルの起点となるディレクトリを設定
BASE=${HOME}

# [antigen]
# Install:
#     curl -L git.io/antigen > ~/.zsh/antigen.zsh
source ${BASE}/.zsh/zshrc.antigen

# zle の設定
source ${BASE}/.zsh/zshrc.zle

# [tmux]
alias tmux='tmux -f <(cat $BASE/.tmux/tmux-prefix-q.conf $BASE/.tmux/tmux-default.conf $BASE/.tmux/tmux-xmonad.conf)'

# aliasの設定
source ${BASE}/.zsh/zshrc.alias

# [pyenv]
source ${BASE}/.zsh/zshrc.pyenv

# [go]
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on