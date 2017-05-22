# 设置继承自ubuntu官方镜像
FROM ubuntu:16.04

# 下面是一些创建者的基本信息
MAINTAINER Dong Li (hi@lidong.me)

# 更新升级，安装必备软件
RUN apt update \
  && apt -y upgrade \
  && apt install -y curl supervisor \
  && mkdir -p /var/log/supervisor \
  && apt-get autoremove \ 
  && rm -rf /var/lib/apt/lists/*

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
