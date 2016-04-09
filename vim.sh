#!/bin/bash
# vim 批量安装
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
config_path=~/.vim/bundle
if [ -e $config_path -a -d $config_path ]
then
    echo "开始安装vim插件"
    cd $config_path
    echo "开始安装vim-python-pep8-indent插件"
    pep8_indent_path="$config_path/vim-python-pep8-indent"
    if [ ! -e $pep8_indent_path ]
    then
    	git clone https://github.com/hynek/vim-python-pep8-indent.git
    else
	echo "已安装vim-python-pep8_indent"
    fi
fi
