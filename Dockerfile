# TYC服务器镜像
# 启动命令：
#    survival: docker run -it --name="survival" -p 25565:25565 -v /root/server/server:/mcdreforged -h="survival" tyc-server:v1.0-alpha
#    creative: docker run -it --name="creative" -p 25566:25566 -v /root/server/creative:/mcdreforged -h="creative" tyc-server:v1.0-alpha


FROM python:3.11


MAINTAINER OptiJava


COPY ./requirements.txt /requirements.txt


WORKDIR /mcdreforged


RUN cd / \
    && wget --quiet https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.tar.gz \
    && tar -xf jdk-17_linux-x64_bin.tar.gz \
    && rm -f jdk-17_linux-x64_bin.tar.gz \
    && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && python3 -m pip install -r /requirements.txt \
    && python3 -m pip install --upgrade pip \
    && cd /mcdreforged \
    && python3 -m mcdreforged init


ENV JAVA_HOME="/jdk-17.0.6"
ENV PATH="$JAVA_HOME/bin:$PATH"

ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 0


CMD python3 -X utf8 -m mcdreforged
