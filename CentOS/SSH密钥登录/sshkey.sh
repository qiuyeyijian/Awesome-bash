#! /bin/bash

# cd /root
cd /root

# 生成ssh密钥，名字为：id_rsa
echo | ssh-keygen

# 进入 /root/.ssh
cd /root/.ssh

# 复制公钥id_rsa.pub到 authorized_keys
cat id_rsa.pub >> authorized_keys

# 显示私钥便于用户复制
echo "SSH私钥为："
cat id_rsa

