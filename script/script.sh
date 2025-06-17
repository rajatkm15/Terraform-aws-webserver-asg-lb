#!/bin/bash

# Update and install Apache (httpd on Ubuntu is apache2)
apt-get update -y
apt install apache2 -y

# Enable and start Apache
systemctl enable apache2
systemctl start apache2

# Get system info
HOSTNAME=$(hostname)
IP_ADDRESS=$(hostname -I | awk '{print $1}')
DATE_TIME=$(date)
UPTIME=$(uptime -p)

# Generate index.html
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>System Info</title>
</head>
<body>
    <h1> Script successfully run!</h1>
    <p><strong>Hostname:</strong> $HOSTNAME</p>
    <p><strong>IP Address:</strong> $IP_ADDRESS</p>
    <p><strong>Date & Time:</strong> $DATE_TIME</p>
    <p><strong>Uptime:</strong> $UPTIME</p>
</body>
</html>
EOF
