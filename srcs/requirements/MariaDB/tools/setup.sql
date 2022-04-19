CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER 'marina'@'localhost';
SET PASSWORD FOR 'marina'@'localhost' = PASSWORD('mdpMarina');
GRANT ALL PRIVILEGES ON wordpress.* TO 'marina'@'localhost' IDENTIFIED BY 'mdpMarina';
GRANT ALL ON wordpress.* to 'marina'@'%' IDENTIFIED BY 'mdpMarina';

FLUSH PRIVILEGES;

CREATE USER 'superuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'superuser'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

CREATE USER 'superuser'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'superuser'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'newpass';
FLUSH PRIVILEGES;
