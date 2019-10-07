#FROM consol/tomcat-8.0
FROM tonkuijt/tomcat-9.0

RUN apt-get update && apt-get -y install unzip
RUN wget -q http://sourceforge.net/projects/geoserver/files/GeoServer/2.16.0/geoserver-2.16.0-war.zip -O /tmp/geoserver.zip
RUN unzip -q /tmp/geoserver.zip -d /tmp
RUN mv /tmp/geoserver.war /usr/local/tomcat/webapps/geoserver.war

# Inserted into startup script to keep catalina from ending the service

RUN echo "#!/bin/bash" >> /root/startup.sh
RUN echo "/usr/local/tomcat/bin/startup.sh" >> /root/startup.sh
RUN echo "while [ true ]; do sleep 30; done" >> /root/startup.sh
RUN chmod 755 /root/startup.sh

EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
