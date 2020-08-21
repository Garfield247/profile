# HomeBrew Source
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export HOMEBREW_NO_AUTO_UPDATE=true

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYTHON_CONFIGURE_OPTS="--enable-framework"

# vim
alias nv="nvim"
alias vim="nvim"


# ranger
alias ra="ranger"
#lazygit
alias lgt="lazygit"

#python
alias py="python"
alias py2="python2"
alias py3="python3"
alias ipy="ipython"

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home
export CLASSPAHT=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$JAVA_HOME/bin:$PATH

# VIM
export MYVIMRC=$HOME/.vimrc

# MYSQL
export PATH=/usr/local/opt/mysql@5.7/bin:$PATH

#GO
export GOPATH=$HOME/Documents/go
export PATH=$GOPATH/bin:$PATH

#maven
export M2_HOME=/usr/local/Cellar/maven/3.6.1/libexec
export PATH=$PATH:$M2_HOME/bin

# App aliases
alias subl="open -a /Applications/Sublime\ Text.app"
alias vscode="open -a /Applications/Visual\ Studio\ Code.app"
alias eclipse="open -a /Applications/Eclipse.app"
alias idea="open -a /Applications/IntelliJ\ IDEA.app"
alias pycharm="open -a /Applications/PyCharm.app"
alias goland="open -a /Applications/GoLand.app"
alias typora="open -a /Applications/Typora.app"

# icu4c
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

# tree
alias tre="tree -N"

# RabbitMQ
PATH=$PATH:/usr/local/sbin

# jupyter notebook
alias jptn="jupyter notebook --notebook-dir=/Users/catman/Documents/Jupyter"
