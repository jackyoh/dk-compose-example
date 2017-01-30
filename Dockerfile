FROM centos:7.2.1511
MAINTAINER jack@is-land.com.tw
RUN yum install -y wget curl tar net-tools lsof telnet
RUN cd /
RUN curl -LO 'http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz' -H 'Cookie: oraclelicense=accept-securebackup-cookie'
RUN tar zxvf jdk-7u71-linux-x64.tar.gz
RUN echo "export JAVA_HOME=/jdk1.7.0_71">>/etc/profile
RUN echo "export PATH=$JAVA_HOME/bin:$PATH">>/etc/profile

RUN wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.73/bin/apache-tomcat-7.0.73.tar.gz -P /opt
RUN cd /opt && tar zxvf /opt/apache-tomcat-7.0.73.tar.gz
ADD ./start.sh /start.sh
CMD ["/bin/bash", "/start.sh"]
