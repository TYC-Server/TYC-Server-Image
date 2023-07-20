# TYC服务器镜像
# 启动命令：
#    survival: docker run --rm -itd --name="survival" --net=host -h="survival" --expose 25566 -v /root/server/survival:/mcdreforged -v /etc/localtime:/etc/localtime optijava/tyc-server:v1.4.1
#    creative: docker run --rm -itd --name="creative" --net=host -h="creative" --expose 25567 -v /root/server/creative:/mcdreforged -v /etc/localtime:/etc/localtime optijava/tyc-server:v1.4.1
#    velocity: docker run --rm -itd --name="vel" --net=host -h="velocity" --expose 25565 -v /root/server/vel:/mcdreforged -v /etc/localtime:/etc/localtime optijava/tyc-server:v1.4.1
# 启动命令中的路径需自行调整


FROM python:3.11.4


COPY ./requirements.txt /requirements.txt
COPY ./start.sh /start.sh


RUN wget https://download.oracle.com/java/19/archive/jdk-19.0.2_linux-x64_bin.tar.gz \
    && tar -xvf jdk-19.0.2_linux-x64_bin.tar.gz \
    && rm -rf jdk-19.0.2_linux-x64_bin.tar.gz \
    && update-alternatives --install /usr/bin/java java /jdk-19.0.2/bin/java 1 \
    && python3 -m pip install --upgrade pip \
    && python3 -m pip install -r /requirements.txt \
    && rm -rf /requirements.txt \
    && apt update \
    && apt upgrade -y \
    && apt clean \
    && mkdir /mcdreforged \
    && cd /mcdreforged \
    && python3 -m mcdreforged init \
    && chmod +x /start.sh \
    && mkdir /qb_multi


WORKDIR /mcdreforged


ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 0


CMD ["/bin/bash", "/start.sh"]
