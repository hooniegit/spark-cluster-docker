FROM ubuntu:22.04

# noninteractivate frontend request
ENV DEBIAN_FRONTEND=noninteractive

# install apt modules
COPY apt-requirements /apt-requirements
RUN [ "apt", "update", "-y" ]
RUN [ "xargs", "-a", "/apt-requirements", "apt", "install", "-y" ]

# set workdir /home
WORKDIR /home

# install spark v3.2.1
RUN [ "wget", "https://archive.apache.org/dist/spark/spark-3.2.4/spark-3.2.4-bin-hadoop3.2.tgz" ]
RUN [ "tar", "-xvf", "spark-3.2.4-bin-hadoop3.2.tgz" ]
RUN [ "mv", "spark-3.2.4-bin-hadoop3.2", "spark" ]
RUN [ "rm", "-rf", "spark-3.2.4-bin-hadoop3.2.tgz" ]

# environment settings
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV SPARK_HOME /home/spark
ENV PATH $PATH:$JAVA_HOME/bin:$SPARK_HOME/bin

# edit environment files
COPY log4j.properties /home/spark/conf/log4j.properties

# run spark automatically
COPY entrypoint-spark.sh /entrypoint-spark.sh
RUN [ "chmod", "+x", "/entrypoint-spark.sh"]
ENTRYPOINT [ "/entrypoint-spark.sh" ]