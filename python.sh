#!/bin/bash
# 通用资源研发组python安装
PYTHON_PATH=/usr/bin/python
PIP_PATH=/usr/local/bin/pip
PYTHON_HOME=/data/server/python2-7-10
NEED_PYTHON=0 # 0需要安装python 1不需要安装python
PIP_FILE=/home/liulong/shell/requirements.txt
INSTALL_DIR=~/Downloads
OS=0 # 0:ubuntu 1:centos
echo $(uname -a)	
if [ $NEED_PYTHON -eq 0 ]
then
    if [ $OS -eq 1]
    then
    	yum install -y mysql-devel bzip2-devel git-core libxslt-devel libevent-devel libcurl-devel libjpeg-dev gcc-c++
    else
	sudo apt-get install python-dev libmysqlclient-dev libevent-dev memcached
    fi
fi
# 判断是否安装curl
type curl-config > /dev/null 2>&1
if [ $? -ne 0 ]
then
    echo "curl_config 不存在开始安装"
    curl https://curl.haxx.se/download/curl-7.48.0.tar.gz -o $INSTALL_DIR/curl-7.48.0.tar.gz\
	&& cd $INSTALL_DIR\
	&& tar zxvf curl-7.48.0.tar.gz \
	&& cd curl-7.48.0\
	&& ./configure\
        && make\
        && sudo make install
fi
export PYCURL_SSL_LIBRARY nss
sudo $PIP_PATH  install -r $PIP_FILE
