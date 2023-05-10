# TYC服务器镜像
# 启动命令：
#    survival: docker run --rm -itd --name="survival" -h="survival" --expose 25565 -p 25565:25565 -p 25565:25565/udp -v /root/server/survival:/mcdreforged -v /etc/localtime:/etc/localtime optijava/tyc-server:v1.0-beta.2
#    creative: docker run --rm -itd --name="creative" -h="creative" --expose 25566 -p 25566:25566 -p 25566:25566/udp -v /root/server/creative:/mcdreforged -v /etc/localtime:/etc/localtime optijava/tyc-server:v1.0-beta.2
#    velocity: docker run --rm -itd --name="vel" -h="velocity" --expose 25565 -p 25565:25565 -p 25565:25565/udp -v /root/server/vel:/mcdreforged -v /etc/localtime:/etc/localtime optijava/tyc-server:v1.0-beta.2


FROM python:3.11.3


COPY ./requirements.txt /requirements.txt


WORKDIR /mcdreforged


RUN cd / \
    && wget https://ghproxy.net/https://github.com/dragonwell-project/dragonwell17/releases/download/dragonwell-standard-17.0.6.0.6%2B9_jdk-17.0.6-ga/Alibaba_Dragonwell_Standard_17.0.6.0.6.9_x64_linux.tar.gz \
    && tar -xf Alibaba_Dragonwell_Standard_17.0.6.0.6.9_x64_linux.tar.gz \
    && rm -f Alibaba_Dragonwell_Standard_17.0.6.0.6.9_x64_linux.tar.gz \
    && update-alternatives --install /usr/bin/java java /dragonwell-17.0.6.0.6+9-GA/bin/java 1 \
    && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && python3 -m pip install -r /requirements.txt \
    && python3 -m pip install --upgrade pip \
    && cd /mcdreforged \
    && python3 -m mcdreforged init


ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 0


CMD python3 -X utf8 -m mcdreforged
