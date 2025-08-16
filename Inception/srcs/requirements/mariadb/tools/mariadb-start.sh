#!/bin/bash

set -e
mysqld_safe --skip-networking & sleep 2

mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS \`test\`;
CREATE USER IF NOT EXISTS \`testuser\`@'localhost' IDENTIFIED BY 'testpassword';
GRANT ALL PRIVILEGES ON \`test\`.* TO \`testuser\`@'localhost';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'testrootpassword';
CREATE USER 'testuser'@'%' IDENTIFIED BY 'testpassword';
GRANT ALL PRIVILEGES ON test.* TO 'testuser'@'%';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p'testrootpassword' shutdown

exec mysqld_safe
