FROM tomcat:9
# Take the war and copy to webapps of tomcat
COPY target/*.war /usr/local/tomcat/webapps/MavenWebApp.war
#RUN cp -avT $CATALINA_HOME/webapps.dist/manager $CATALINA_HOME/webapps/manager
#COPY target/*.war /usr/local/tomcat/work/Catalina/localhost/MavenWebApp/MavenWebApp.war


RUN ln -s /usr/local/tomcat/webapps.dist/manager webapps/manager
RUN ln -s /usr/local/tomcat/webapps.dist/host-manager webapps/host-manager
RUN ln -s /usr/local/tomcat/webapps.dist/ROOT webapps/ROOT

#RUN ln -s /usr/local/tomcat/webapps/MavenWebApp.war /usr/local/tomcat/work/Catalina/localhost/MavenWebApp
#RUN ln -s /usr/local/tomcat/webapps/MavenWebApp.war   webapps.dist
#RUN ln -s /usr/local/tomcat/webapps/MavenWebApp.war  webapps.dist
#CMD ["catalina.sh", "run"]
