#!/bin/bash
# 通用机器安装环境
function str_index() {
   str1=$1
   str2=$2
   echo "str1="$str1
   echo "str2="$str2
   result=$(echo $str1 | grep "${str2}")
   if [ -z $result ] ; then
       echo "没有匹配到"
       return 0
   else
       return 1
   fi
}
PYENV_HOME=$HOME/.pyenv
OS=0 #0:ubuntu 1:centos
INSTALL=apt
echo "创建data目录"
sudo mkdir -p /data
sudo mkdir -p ~/software
sudo chown -R liulong.liulong /data
echo "创建data目录结束"
if [ $OS -eq 1 ]; then
    INSTALL= yum
fi

if [ ! -e /usr/bin/git ]
then
    echo "安装git"
    sudo $INSTALL install git
    git config --global user.name liulong
    git config --global user.email liulong@zhangyue.com
else
    echo "git已安装"
fi
if [ ! -e /usr/bin/vim ]
then
    echo "安装vim"
    sudo $INSTALL install vim
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
else
    echo "vim已安装"
fi

if [ ! -e /usr/bin/zsh ]
then
    echo "安装zsh"
    sudo $INSTALL install zsh
else
    echo "zsh已安装"
fi
if [ ! -d ~/.oh-my-zsh ]
then
    echo "安装oh-my-zsh" 
    /bin/sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    cp zshrc ~/.zshrc
else
    echo "oh-my-zsh已安装"
fi
if [ ! -d $PYENV_HOME ]
then
    echo "安装pyenv"
    if [ $OS -eq 1]; then
    	sudo yum install readline readline-devel readline-static -y
    	sudo yum install openssl openssl-devel openssl-static -y
    	sudo yum install sqlite-devel -y
    	sudo yum install bzip2-devel bzip2-libs -y
    	sudo yum install libcurl-devel -y
    elif [ $OS -eq 0 ]; then
        sudo apt-get -y install build-essential libssl-dev libevent-dev libjpeg-dev libxml2-dev
        sudo apt-get -y install libxslt-dev
        sudo apt-get -y install libmysqlclient-dev
        sudo apt-get -y install zlib1g-dev
        sudo apt-get -y install libcurl4-openssl-dev
        sudo apt-get -y install libmemcached-dev
        sudo apt-get -y install libsqlite3-dev 
        sudo apt-get -y install sqlite3
    fi
	
    echo "下载pyenv"
    git clone git://github.com/yyuu/pyenv.git ~/.pyenv
    
    echo "export PYENV_ROOT=$PYENV_HOME " >> ~/.zshrc
    echo "export PATH=\$PYENV_ROOT/bin:\$PATH " >> ~/.zshrc
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
if [ $exists -eq 1 ] ; then
    echo "python2.7.12已安装"
else
    echo "安装python2.7.12"
    pyenv install 2.7.12
fi
str_index $pythons "3.6.0"
exists=$?
if [ $exists -eq 1 ] ; then
    echo "python3.6.0已安装"
else
    echo "安装python3.6.0"
    pyenv install 3.6.0
fi
pyenv global 2.7.12
echo $(type python)
has_virtualenv=$(pip show virtualenv | sed 's/*//g' | sed 's/ //g' | sed ":a;N;s/\n//g;ta")
if [ $has_virtualenv="" ]; then
    has_virtualenv="test"
fi
str_index $has_virtualenv 'virtualenv'
exists=$?
echo "virtualenv result=$exists"
if [ $exists -eq 1 ] ; then
    echo "已经安装virtualenv"
else
    echo "安装virtualenv"
    pip install virtualenv
    echo "安装virtualenvwrapper"
    pip install virtualenvwrapper
    echo "创建virtualenv home"
    mkdir -p /data/server/virtualenvs
    echo "export VIRTUALENVWRAPPER_PYTHON=$HOME/.pyenv/versions/2.7.12/bin/python" >>$HOME/.zshrc
    echo "export VIRTUALENVWRAPPER_VIRTUALENV=$HOME/.pyenv/versions/2.7.12/bin/virtualenv" >>$HOME/.zshrc
    echo "export WORKON_HOME=/data/server/virtualenvs" >>$HOME/.zshrc
    echo "source  $HOME/.pyenv/versions/2.7.12/bin/virtualenvwrapper.sh"  >>$HOME/.zshrc
    source ~/.zshrc
    echo "完成安装虚拟环境"
fi
echo "下载pycharm"
wget -o  ~/software/pycharm.tar.gz -v https://download.jetbrains.8686c.com/python/pycharm-professional-2018.2.1.tar.gz
cd ~/software
tar -zxvf pycharm.tar.gz
echo "下载pycharm结束"
