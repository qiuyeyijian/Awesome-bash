## port.sh

### 功能

开启或者关闭端口

### 使用

#### 1. 下载脚本
```
git clone https://gitee.com/qiuyeyijian/bash.git
```
#### 2. 给予相应权限

```bash
chmod -x port.sh
```
or

```bash
chmod -x port.sh
```
#### 3. 运行脚本

```bash
./port.sh [add/remove] [port] [tcp/udp]
```

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

