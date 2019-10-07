#FROM consol/tomcat-8.0
FROM tonkuijt/tomcat-9.0

RUN apt-get update && apt-get -y install unzip
RUN wget -q http://sourceforge.net/projects/geoserver/files/GeoServer/2.6.2/geoserver-2.6.2-war.zip -O /tmp/geoserver.zip
RUN unzip -q /tmp/geoserver.zip -d /tmp
RUN mv /tmp/geoserver.war /usr/local/tomcat/webapps/geoserver.war

# Inserted into startup script to keep catalina from ending the service

RUN echo "while [ true ]; do sleep 30; done" >> /usr/local/tomcat/bin/startup.sh

EXPOSE 8080
CMD /usr/local/tomcat/bin/startup.sh
