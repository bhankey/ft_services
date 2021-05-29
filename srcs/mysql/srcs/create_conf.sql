CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
GRANT ALL ON wordpress.* TO 'bhankey'@'%' IDENTIFIED BY 'bhankey';
FLUSH PRIVILEGES;