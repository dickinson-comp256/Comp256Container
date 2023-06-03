# This script is run by the Dockerfile as root during the build process.
# It should be used to do system wide configuration of the image.
# Very typically this includes installing and configuring software 
# using apt install.

# E.g.
# apt update
# apt install --no-install-recommends -y aPackage

apt update
apt install --no-install-recommends -y \
  default-jdk \
  sqlite3 \
  libsqlite3-dev \
  nodejs \
  npm

# Get the Northwind sample database and ensure student user can write it.
mkdir /db
chmod o+w /db
curl https://raw.githubusercontent.com/jpwhite3/northwind-SQLite3/master/dist/northwind.db > /db/Northwind.db
chmod o+w /db/Northwind.db

# Setup Tomcat following the process at: 
# https://linuxhostsupport.com/blog/how-to-install-apache-tomcat-10-on-debian-10/
cd /opt
useradd -m -d /opt/tomcat -U -s /bin/false tomcat
wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz
tar -xzvf apache-tomcat-9.0.75.tar.gz -C /opt/tomcat --strip-components=1

# Note: There are security issues with the following so it is
# not intended for production use.
#chown -R tomcat:tomcat /opt/tomcat/ 
#chmod -R u+x,g+rwx /opt/tomcat/ 
#usermod -a -G tomcat student
#ln -s /opt/tomcat/api /home/student/api 
#ln -s /opt/tomcat/webapps/www /home/student/www

