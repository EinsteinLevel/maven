FROM ubuntu:20.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install default-jdk maven git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR /boxfuse-sample-java-war-hello/target
RUN git config --global user.name "EinsteinLevel" \
&& git config --global user.email albertkpost@gmail.com \
&& git config --global github.user albertkpost@gmail.com \
&& git config --global github.token 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 \
&& git init \
&& git remote add origin https://github.com/EinsteinLevel/build_an.git \
&& git add hello-1.0.war \
&& git commit -m "hello1.0" \
&& git branch -M main \
&& git push -u origin main