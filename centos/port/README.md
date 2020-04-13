### 功能

开启或者关闭端口

#### 运行

`chmod -x port.sh` 是赋予文件可执行权限

```bash
chmod -x port.sh && ./port.sh [add/remove] [port] [tcp/udp]
```
or
```bash
chmod -755 port.sh && ./port.sh [add/remove] [port] [tcp/udp]
```
例如：

* 开启端口

```bash
./port.sh add 8080 tcp
./port.sh add 8080 udp
```
* 关闭端口

```bash
./port.sh remove 8080 tcp
./port.sh remove 8080 udp
```



### 附录： port.sh

```bash
#! /bin/bash

# 获取防火墙状态
FIREWALL_STATE=$(firewall-cmd --state)
# 增加或者删除
ACTION=$1
# 端口号
PORT=$2
# 协议
PROTOCOL=$3

#判断防火墙状态, 如果没有运行就打开防火墙
if [ $FIREWALL_STATE != "running" ]
then
        # 开启防火墙服务
        systemctl start firewalld.service
        # 允许开机自启动
        systemctl enable firewalld.service
        # 重启防火墙
        systemctl restart firewalld.service
fi

# 如果防火墙已打开
if [ $FIREWALL_STATE = "running" ]
then
	firewall-cmd --zone=public --${ACTION}-port=${PORT}/${PROTOCOL} --permanent
	systemctl restart firewalld.service
fi

# 列出开放的端口号
firewall-cmd --list-ports
```

