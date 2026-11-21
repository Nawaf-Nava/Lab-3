FROM tomcat:9.0.30-jdk11

LABEL org.opencontainers.image.title="Tomcat Ghostcat Training Lab"
LABEL org.opencontainers.image.description="Intentionally outdated Tomcat for isolated local coursework"

# Replace the default server configuration with the lab configuration.
COPY server.xml /usr/local/tomcat/conf/server.xml

EXPOSE 8080 8009
CMD ["catalina.sh", "run"]
