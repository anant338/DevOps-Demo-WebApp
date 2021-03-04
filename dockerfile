from tomcat:latest

RUN mkdir /usr/local/tomcat/webapps/mywebapp

COPY target/AVNCommunication-1.0.war /usr/local/tomcat/webapps/QAWebapp.war
