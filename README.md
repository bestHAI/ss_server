# 在 Linux 上部署 ShadowSocks 服务

## 一、快速部署

* `git clone https://github.com/bestHAI/ss_server.git`

* `cd ss_server`

* `chmod +x auto_run.sh && ./auto_run.sh 【登陆密码】`

## 二、参数配置

* 修改 `ss_server/deploy.yml` 文件的相应参数：

    ```yaml
    ports:
      - "8388:8388"  # 端口绑定
    environment:
      - SERVER_ADDR=0.0.0.0  # 监听地址
      - SERVER_PORT=8388  # 监听端口
      - METHOD=aes-256-gcm  # 加密方式
      - PASSWORD=yourpasswd  # 登陆密码
      - TIMEOUT=600  # 超时时间
    ```

##  三、日常管理

* 启动（以下选其一）：

    * `./auto_run.sh`
    
    * `./tools/up.sh`

* 停止

    * `./tools/down.sh`
    
* 查看日志

    * `./tools/log.sh`

##  四、客户端下载

* [Windows 客户端](https://github.com/shadowsocks/shadowsocks-windows/releases/download/4.1.5/Shadowsocks-4.1.5.zip)

* [Android 客户端](https://github.com/shadowsocks/shadowsocks-android/releases/download/v4.7.4/shadowsocks--universal-4.7.4.apk)

* [更多其他平台的客户端](http://shadowsocks.org/en/download/clients.html)

## 五、共享配置

* Windows 平台

    * 在 shadowsocks 文件夹找到以下两个文件，复制粘贴即可：

    * `gui-config.json`：配置服务器，端口，密码等

    * `pac.txt`：配置哪些域名需要代理

* Android 平台

    * 在 `tools` 文件夹下，找到 `json_to_ss.py` 的脚本
    
    * 运行 `pytho json_to_ss.py 【你的配置文件】`
    
    * 复制，在手机端找到【从剪贴板导入】

##  六、官方导航

* [ShadowSocks 官网](http://shadowsocks.org)

* [ShadowSocks in Docker Hub](https://hub.docker.com/r/shadowsocks/shadowsocks-libev)

* [ShadowSocks in GitHub](https://github.com/shadowsocks)