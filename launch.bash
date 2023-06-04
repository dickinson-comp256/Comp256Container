# Add commands to be run at startup to this file.
# These commands might start services or servers that should be running in the container.
# All commands in this file should run background commands.

/opt/tomcat/bin/catalina.sh run &

npx nodemon /home/student/WebAbstractions/api/server.js &