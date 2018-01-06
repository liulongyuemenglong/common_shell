#!/bin/bash
# 通用机器安装环境
function str_index() {
   str1=$1
   str2=$2
   result=$(echo $str1 | grep "${str2}")
   echo "result=$result"
   if [ -z $result ] ; then
       echo "没有匹配到"
       return 0
   else
       return 1
   fi
}
PYENV_HOME=$HOME/.pyenv
if [ ! -e /usr/bin/zsh ]
then
    echo "安装zsh"
    sudo yum install zsh
else
    echo "zsh已安装"
fi
if [ ! -d ~/.oh-my-zsh ]
then
    echo "安装oh-my-zsh" 
    /bin/sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "oh-my-zsh已安装"
fi
if [ ! -d $PYENV_HOME ]
then
    echo "安装pyenv"
    sudo yum install readline readline-devel readline-static -y
    sudo yum install openssl openssl-devel openssl-static -y
    sudo yum install sqlite-devel -y
    sudo yum install bzip2-devel bzip2-libs -y
	
    echo "下载pyenv"
    git clone git://github.com/yyuu/pyenv.git ~/.pyenv
    
    echo "export PYENV_ROOT=$PYENV_HOME " >> ~/.zshrc
    echo "export PATH =\$PYENV_ROOT/bin:\$PATH " >> ~/.zshrc
    echo "eval \"\$(pyenv init -)\"" >> ~/.zshrc

    source ~/.zshrc
else
    echo "pyenv已安装"
fi
echo "安装python"
pythons=$(pyenv versions | sed 's/*//g' | sed 's/ //g' | sed ":a;N;s/\n//g;ta")
str_index ''$pythons "2.7.12"
exists=$?
echo "exists=$exists"
if [ "$exists"!="0" ] ; then
    echo "python2.7.12已安装"
else
    echo "安装python2.7.12"
    pyenv install 2.7.12
fi
str_index $pythons "3.6.0"
exists=$?
if [ "$exists"!="0" ] ; then
    echo "python3.6.0已安装"
else
    echo "安装python3.6.0"
    pyenv install 3.6.0
fi

    
