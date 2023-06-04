# This script is run by the Dockerfile as root during the build process.
# It should be used to do system wide configuration of the image.
# Very typically this includes installing and configuring software 
# using apt install.

# E.g.
# apt update
# apt install --no-install-recommends -y aPackage

apt update
apt install --no-install-recommends -y \
  openjdk-17-jdk \
  sqlite3 \
  libsqlite3-dev \
  nodejs \
  npm \
  unzip

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

# Allow the student user see/write the stuff in /opt/tomcat.
chown -R tomcat:tomcat /opt/tomcat/ 
chmod -R u+x,g+rwx /opt/tomcat/ 
usermod -a -G tomcat student

# Install and configure a cursive font that is needed for the web abstractions unit.
cd /usr/share/fonts
wget https://www.cdnfonts.com/download/zapfino-cdnfonts.zip
unzip zapfino-cdnfonts.zip
rm zapfino-cdnfonts.zip

# Install the JSONView extension into firefox.
cd /usr/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}
wget https://addons.mozilla.org/firefox/downloads/file/4115735/jsonview-2.4.2.xpi
mv jsonview-2.4.2.xpi jsonview@brh.numbera.com.xpi
