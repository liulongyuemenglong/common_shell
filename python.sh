#!/bin/bash
# 通用资源研发组python安装
PYTHON_PATH=/usr/bin/python
PIP_PATH=/usr/local/bin/pip
PYTHON_HOME=/data/server/python2-7-10
NEED_PYTHON=1 # 0需要安装python 1不需要安装python
PIP_FILE=/home/liulong/project/common_shell/requirements.txt
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
    # # 安装easy_install
    # curl https://bootstrap.pypa.io/ez_setup.py -o - |sudo python
    # # 安装pip
    # curl https://pypi.python.org/packages/source/p/pip/pip-8.1.1.tar.gz#md5=6b86f11841e89c8241d689956ba99ed7 -o $INSTALL_DIR/pip-8.1.1.tar.gz\
	# && cd $INSTALL_DIR\
	# && tar zxvf pip-8.1.1.tar.gz \
	# && cd pip-8.1.1\
	# && python setup.py install
fi
# 安装snappy
echo "snappy 安装开始"
curl https://codeload.github.com/google/snappy/legacy.tar.gz/master -o $INSTALL_DIR/google-snappy-1.1.3-9-gd53de18.tar.gz\
    && cd $INSTALL_DIR\
    && tar zxvf google-snappy-1.1.3-9-gd53de18.tar.gz \
    && cd google-snappy-d53de18 \
    && /bin/bash autogen.sh\
    && ./configure\
    && make\
    && sudo make install
# 安装libmemcached
echo "libmemecache 安装开始"
curl https://launchpadlibrarian.net/39068389/libmemcached-0.38.tar.gz -o $INSTALL_DIR/libmemcached-0.38.tar.gz\
    && cd $INSTALL_DIR\
    && mkdir -P libmemcached-0.38
    && tar zxvf libmemcached-0.38.tar.gz ./libmemcached-0.38 \
    && cd libmemcached-0.38 \
    && ./configure\
    && make\
    && sudo make install
export PYCURL_SSL_LIBRARY nss
sudo $PIP_PATH  install -r $PIP_FILE
