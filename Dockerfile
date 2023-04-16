# TYC服务器镜像
# 启动命令：
#    survival: docker run --rm -it --name="survival" --expose 25565 -p 25565:25565 -p 25565:25565/udp -v /root/server/server:/mcdreforged -v /etc/localtime:/etc/localtime -h="survival" optijava/tyc-server:v1.0-beta.1
#    creative: docker run --rm -it --name="creative" --expose 25566 -p 25566:25566 -p 25566:25566/udp -v /root/server/creative:/mcdreforged -v /etc/localtime:/etc/localtime -h="creative" optijava/tyc-server:v1.0-beta.1


FROM python:3.11.3


COPY ./requirements.txt /requirements.txt


WORKDIR /mcdreforged


RUN cd / \
    && wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.tar.gz \
    && tar -xf jdk-17_linux-x64_bin.tar.gz \
    && rm -f jdk-17_linux-x64_bin.tar.gz \
    && update-alternatives --install /usr/bin/java java /jdk-17.0.6/bin/java 1 \
    && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && python3 -m pip install -r /requirements.txt \
    && python3 -m pip install --upgrade pip \
    && cd /mcdreforged \
    && python3 -m mcdreforged init


ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 0


CMD python3 -X utf8 -m mcdreforged
