# Pull ubuntu base image.
FROM ubuntu 

# Maintainer
# ----------
MAINTAINER David Winters <dwinters@c2b2.co.uk>

ENV PAYARA_PKG search.maven.org/remotecontent?filepath=fish/payara/extras/payara-micro/4.1.153/payara-micro-4.1.153.jar
ENV PKG_FILE_NAME payara-micro.jar

#Install packages on ubuntu base image

RUN \
 apt-get update && \ 
 apt-get install -y wget && \ 
 apt-get install -y software-properties-common python-software-properties


# Install Java 8

RUN \
  add-apt-repository -y ppa:openjdk-r/ppa && \
  apt-get update && \
  apt-get install -y openjdk-8-jdk && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# add payara user, download payara micro build. Download sample war app and package on image.

RUN useradd -b /opt -m -s /bin/bash payara && echo payara:payara | chpasswd
RUN cd /opt && wget $PAYARA_PKG -O $PKG_FILE_NAME
RUN mkdir -p /opt/payara-micro-wars
RUN chown -R payara:payara /opt


# Set up payara user and the home directory for the user
USER payara
WORKDIR /opt
ENTRYPOINT ["java", "-jar", "payara-micro.jar", "--deploymentDir", "/opt/payara-micro-wars"]

