#!/bin/bash

thisdir=$(cd $(dirname $0); pwd)
echo $thisdir
declare -A profiles
profiles=(
    [nvim]="$HOME/.config/nvim/init.vim"
    [tmux]="$HOME/.tmux.conf"
    [zshrc]="$HOME/.zshrc"
    [bashrc]="$HOME/.bash_profile"
)

for pf in $(echo ${!profiles[*]})
do
    echo "正在备份$pf配置文件 : ${profiles[$pf]} --》$thisdir"
    cp ${profiles[$pf]} $thisdir
done

git add -A

git commit -m "$(date)"

git push -u origin
