FROM harbor.weiboyi.com/base/tomcat:9.0.0.M9-alpine

MAINTAINER Jared <lijie1@weiboyi.com>

ENV TOMCAT_HOME="/usr/local/tomcat-latest"

ENV SearchLogDir="/var/weiboyi/search/API/log/SearchEngine"

ENV TestResultDir="/var/weiboyi/search/API/test/profermance/log"

RUN mkdir -p ${SearchLogDir} ${TestResultDir}

WORKDIR ${TOMCAT_HOME}

#COPY ./search webapps/search

ADD ./docker-entrypoint.sh /usr/bin/

EXPOSE 8080

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["bin/catalina.sh", "run"]
