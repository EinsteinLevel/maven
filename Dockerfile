FROM ubuntu:20.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install default-jdk maven git -y \
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git \
&& mvn package boxfuse-sample-java-war-hello/POM.xml