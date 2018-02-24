###########################################
# 摘    要: openvpn.sh
# 创 建 者: liulong
# 创建日期: 2017-06-04
###########################################
#!/bin/bash

echo "开始杀死openvpn"
ps -ef|grep openvpn | grep -v grep |grep -v 'openvpn.sh' | awk '{print $2}' |sudo xargs kill -9
echo "开始启动openvpn"
sudo nohup openvpn  --config /etc/openvpn/client.ovpn --ca /etc/openvpn/ca.crt --cert /etc/openvpn/client-liul.crt  --key /etc/openvpn/client-liul.key&
echo "退出"
