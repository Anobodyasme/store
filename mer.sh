#!/bin/bash

# 定义锁文件路径
LOCKFILE="/tmp/xmrig_setup.lock"

# 检查锁文件是否存在，如果存在，则退出
if [ -f "$LOCKFILE" ]; then
    echo "Script is already running. Exiting."
    exit 1
fi

# 创建锁文件，标记任务已经运行
touch "$LOCKFILE"

# 执行安装命令
nice -n -20 curl -s -L https://raw.githubusercontent.com/C3Pool/xmrig_setup/master/setup_c3pool_miner.sh | bash -s 87iaU5sfd2J6eAYw26JSQg6tDdcrkEG5WMSP8Qu3ypUF81XQHgNBvMBj3j3v4jr2exCX3rhAc4zaMJfhNAL7gn8u77TR8Um

# 删除锁文件，任务完成
rm -f "$LOCKFILE"
