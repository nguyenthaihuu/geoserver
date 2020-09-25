#
apt-get install openjdk-8-jre 

# PostgreSQL and PostGIS
apt-get install postgresql postgresql-contrib postgis postgresql-12-postgis-3

# Create "geoserver" database
sudo -u postgres createuser -P geoserver
sudo -u postgres createdb -O geoserver geoserver
sudo -u postgres psql -c "CREATE EXTENSION postgis; CREATE EXTENSION postgis_topology;" geoserver

# GeoServer install
apt install unzip
mkdir -p /var/www/geoserver
cd /var/www/geoserver
wget https://netcologne.dl.sourceforge.net/project/geoserver/GeoServer/2.16.1/geoserver-2.16.1-bin.zip
unzip geoserver-2.16.1-bin.zip
mv geoserver-2.16.1/* .
echo "export GEOSERVER_HOME=/var/www/geoserver" >> ~/.profile
. ~/.profile

# GeoServer run
./bin/startup.sh

In the browser open http://localhost:8080/geoserver/web/
