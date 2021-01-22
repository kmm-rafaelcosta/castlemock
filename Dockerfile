FROM tomcat:8.5-jdk11-openjdk
MAINTAINER Danilo Liebel <danilo.liebel@kmm.com.br>

# Delete the default applications
RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN rm -rf /usr/local/tomcat/webapps/docs
RUN rm -rf /usr/local/tomcat/webapps/examples
RUN rm -rf /usr/local/tomcat/webapps/manager
RUN rm -rf /usr/local/tomcat/webapps/host-manager
COPY deploy/deploy-tomcat/deploy-tomcat-war/target/castlemock.war /usr/local/tomcat/webapps/castlemock.war
# Change directory to Tomcat webapps folder and download the latest Castle Mock war file
#RUN cd /usr/local/tomcat/webapps && curl -o castlemock.war -fSL https://github.com/castlemock/castlemock/releases/download/v1.52/castlemock.war
RUN cd /usr/local/tomcat/webapps
# Expose HTTP port 8080
EXPOSE 8080
