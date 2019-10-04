FROM ubuntu:18.04

MAINTAINER biwed.ru "biwed.ru@gmail.com"

# Initial image settings
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends  apt-utils\
        # Provide some useful scripts for adding and removing PPAs:
        # add-apt-repository & apt-add-repository
        software-properties-common \
        # For install from https repos
        apt-transport-https \
        # For add key with apt-key
        gpg-agent \
    # Remove orphan packages and apt cache
    && apt-get autoremove -y && apt-get clean all

# Setting localtime for tzdata
ENV TZ=Asia/Vladivostok
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt-get update && apt-get install -y --no-install-recommends tzdata \
    && apt-get autoremove -y && apt-get clean all

# Set Russian locale
RUN apt-get update && apt-get install -y --no-install-recommends locales \
    && echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen ru_RU.utf8 \
    && /usr/sbin/update-locale LANG=ru_RU.UTF-8 \
    && apt-get autoremove -y && apt-get clean all
ENV LANG=ru_RU.UTF-8 \
    LANGUAGE=ru_RU.UTF-8 \
    LC_ALL=ru_RU.UTF-8

# Open JDK and utils
RUN apt-get update \
      && apt-get install -y --no-install-recommends openjdk-8-jdk \
         git \
         unzip \ 
         wget \
      && apt-get autoremove -y && apt-get clean all

# Install Pentaho Data Integration

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

ENV PDI_VERSION=8.3 \
    PDI_BUILD=8.3.0.0-371 \
    JRE_HOME=${JAVA_HOME} \
    PENTAHO_JAVA_HOME=${JAVA_HOME} \
    PENTAHO_HOME=/opt/pentaho \
    USER_KETTLE_HOME=/opt/pentaho/data-integration \
    USER_KETTLE_REPOSITORY=/opt/pentaho/data-integration/repo \
    MYSQL_DRIVER_VERSION=5.1.42

#Install Pentaho Data Integration

RUN wget -O /tmp/pdi-ce.zip https://sourceforge.net/projects/pentaho/files/Pentaho%20${PDI_VERSION}/client-tools/pdi-ce-${PDI_BUILD}.zip \
    && unzip  /tmp/pdi-ce.zip -d ${PENTAHO_HOME}  \
    && rm -f /tmp/pdi-ce.zip 

WORKDIR ${USER_KETTLE_HOME}

RUN wget http://central.maven.org/maven2/mysql/mysql-connector-java/${MYSQL_DRIVER_VERSION}/mysql-connector-java-${MYSQL_DRIVER_VERSION}.jar \
    && rm -f lib/mysql*.jar \
    && mv *.jar lib/ \
    && chmod +x *.sh

WORKDIR /
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]
