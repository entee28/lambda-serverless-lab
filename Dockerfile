FROM jenkins/jnlp-slave:latest-jdk11

ENV LANG="en_US.UTF-8"
ENV LOCALE="UTF-8"
ENV TZ=Asia/Ho_Chi_Minh

USER root
RUN apt update && apt upgrade -y && apt install -y git curl wget iputils-ping telnet net-tools lsof unzip vim dnsutils

RUN usermod -aG root jenkins
USER jenkins

# Install Serverless
RUN curl -o- -L https://slss.io/install | bash