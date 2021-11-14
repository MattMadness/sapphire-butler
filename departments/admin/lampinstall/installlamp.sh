#pkcon install -y apache mariadb mariadb-clients libmariadbclient php php-apache
pacman -S --noconfirm apache mariadb mariadb-clients libmariadbclient php php-apache
sed -i 's/LoadModule unique_id_module modules\/mod_unique_id.so/#LoadModule unique_id_module modules\/mod_unique_id.so/g' /etc/httpd/conf/httpd.conf
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sed -i 's/LoadModule mpm_event_module module\/mod_mpm_event.so/#LoadModule mpm_event_module module\/mod_mpm_event.so/g' /etc/httpd/conf/httpd.conf
echo "LoadModule mpm_prefork_module modules/mod_mpm_prefork.so" >> /etc/httpd/conf/httpd.conf
echo "LoadModule php7_module modules/libphp7.so" >> /etc/httpd/conf/httpd.conf
echo "AddHandler php7-script php" >> /etc/httpd/conf/httpd.conf
echo "Include conf/extra/php7_module.conf" >> /etc/httpd/conf/httpd.conf
systemctl enable httpd
systemctl start httpd
systemctl enable mysqld
systemctl start mysqld

