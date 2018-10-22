#!/bin/sh

#export O_ServiceName="ss-client"
#export O_ServicePath="/lib/systemd/system/${O_ServiceName}.service"
#export O_ConfigPath="/etc/shadowsocks/client.json"
set -e

export O_ServiceName="ss-client"
export O_ServicePath="$HOME/lib/systemd/system/${O_ServiceName}.service"
export O_ConfigPath="$HOME/etc/shadowsocks/client.json"

#输入配置文件路径
echo "请输入配置文件路径，默认路径为: \"${O_ConfigPath}\"(Y/N?)"
read opt

opt=$(echo $opt | tr '[:upper:]' '[:lower:]')
if [[ $opt == "yes" ]] || [[ $opt == "y" ]]; then
   read O_ConfigPath
   echo "配置文件路径为: $O_ConfigPath"
elif [[ "$opt" == "no" ]] || [[ $opt == "n" ]]; then
   echo "配置文件路径为: $O_ConfigPath"
else
    echo "输入错误，保持默认配置文件路径"
fi
sleep 2

#生成 service 文件
./create_service.sh

#允许开机自起
#sudo systemctl enable ss-client


echo "===================================="
echo "| systemctl start ss-client 启动   |"
echo "| systemctl stop ss-client 结束    |"
echo "| systemctl restart ss-client 重启 |"
echo "===================================="

