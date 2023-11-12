# TYC服务器Docker镜像

参考了MCDR官方docker镜像，相当于一个比较精简的MCDR镜像

# 启动命令

survival:

`docker run --rm -itd --name="survival" --net=host -h="survival" --expose 25566 -v /root/server/survival:/mcdreforged -v /etc/localtime:/etc/localtime optijava/tyc-server:VERSION`

creative:

`docker run --rm -itd --name="creative" --net=host -h="creative" --expose 25567 -v /root/server/creative:/mcdreforged -v /etc/localtime:/etc/localtime optijava/tyc-server:VERSION`

velocity:

`docker run --rm -itd --name="vel" --net=host -h="velocity" --expose 25565 -v /root/server/vel:/mcdreforged -v /etc/localtime:/etc/localtime optijava/tyc-server:VERSION`

**_启动命令中的路径以及端口需自行调整，目前仅给出了三种模板。_**

# 内置环境

- Oracle JDK 19.0.2_linux-x64
- Python 3.11.4
- MCDReforged 最新版（每次run时自动更新mcdr到最新版）
- 一些mcdr插件常用的python依赖

随时更新依赖awa


