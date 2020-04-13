

### 功能

改变SSH登录端口号，关闭用户密码登录，使得系统只能使用秘钥登录

### 使用

#### 0. 准备

* 开放你将要修改的SSH端口号，可以使用仓库中的脚本`/centos/port/port.sh`
* 因为我们假设你的服务器是刚刚搭建的，所以你的`~/.ssh/`目录下没有`id_rsa 和 id_rsa.pub`文件，因为此脚本会生成这两个文件

#### 1. 给予可执行权限

```bash
chmod -x ssh.sh && ./ssh.sh [端口号]
```
or
```bash
chmod 755 port.sh ./ssh.sh [端口号]
```

例如：

```bash
./ssh.sh 2333
```



### 附录：脚本内容

```bash
#! /bin/bash
# ======================================
# author: qiuyeyijian
# ======================================

# 回到根目录
cd ~

# 生成ssh密钥，名字为：id_rsa
echo | ssh-keygen

# 进入 .ssh
cd .ssh

# 复制公钥id_rsa.pub到 authorized_keys
cat id_rsa.pub >> authorized_keys

# 更改SSH端口号, 禁止密码登录
if [ $1 ]
then
        # 更改SSH端口号
        sed -i "s/#Port 22/Port $1/g" /etc/ssh/sshd_config

        # 禁止账号密码登录
        sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

fi

# 显示私钥便于用户复制
echo "你现在可以凭借SSH私钥登录到此系统了！"
echo "SSH私钥为："
cat id_rsa
```

