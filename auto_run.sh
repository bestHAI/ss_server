#!/bin/bash

work_path=$(dirname $(readlink -f "$0"))
init_log="${work_path}/logs/init.log"

# 检查是否为初次启动
if [[ ! -f "${init_log}" ]]
then
    echo -e "\e[1;32m\n\t\t===> init <===\n\e[m"

    echo -e "\n>>> creat init.data"
    date >> "${init_log}"

    # 检查是否安装 Docker
    echo -e "\n>>> check docker"
    if [[ $(which docker | wc -l) -eq 0 ]]
    then
        echo "docker ===> installing"

        sudo curl -sSL https://get.docker.com | sh && systemctl start docker && systemctl enable docker

    else
        echo "docker ===> ok"
    fi
    docker -v | tee -a "${init_log}"

    # 给予相关文件的执行权限
    chmod +x ./tools/*

    # 初始化 swarm
    docker swarm init

    # 更改登陆密码
    if [[ $# -eq 1 ]]
    then
        sed -i "s/yourpasswd/$1/g" ${work_path}/deploy.yml > "/dev/null"
    fi

fi

# 开始部署
if [[ $(which docker | wc -l) -eq 1 &&  -f "${init_log}" ]]
then
    echo -e "\e[1;32m\n\t\t===> deploy <===\n\e[m"
    docker stack deploy -c ./deploy.yml ss_server
fi
