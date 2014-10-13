# Init script for VVV NoTallOrder

echo "Commencing VVV NoTallOrder Demo 1 Site"

# Make a database, if we don't already have one
echo "Creating database (if it's not already there)"
mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS vvv_notallorder_demo1"
mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON vvv_notallorder_demo1.* TO wp@localhost IDENTIFIED BY 'wp';"

# Download WordPress
if [ ! -d htdocs ]
then
	echo "Installing WordPress using WP CLI"
	mkdir htdocs
	cd htdocs
	wp core download 
	wp core config --dbname="vvv_notallorder_demo1" --dbuser=wp --dbpass=wp --dbhost="localhost"
	wp core install --url=NoTallOrderDemo1.dev --title="NoTallOrder Demo 1" --admin_user=admin --admin_password=password --admin_email=demo@example.com
	cd ..
fi

# The Vagrant site setup script will restart Nginx for us

echo "VVV NoTallOrder Demo 1 site now installed";
