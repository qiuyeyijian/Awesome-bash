#! /bin/bash

# 获取防火墙状态
FIREWALL_STATE=$(firewall-cmd --state)
RUNNING="running"
# 获取要开放的端口号
PORT=$1
# 开放端口协议
PROTOCOL=$2

if [ $FIREWALL_STATE != $RUNNING ]
then
        # 开启防火墙服务
        systemctl start firewalld.service
        # 允许开机自启动
        systemctl enable firewalld.service
        # 重启防火墙
        systemctl restart firewalld.service
fi
if [ $FIREWALL_STATE = $RUNNING ]
then
        firewall-cmd --zone=public --add-port=${PORT}/${PROTOCOL} --permanent
fi

# 重启防火墙
systemctl restart firewalld.service

# 查看开放的端口
firewall-cmd --list-ports
