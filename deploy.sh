#!/bin/bash

# This script is for deploying the website to an Alibaba Cloud ECS server.
# It assumes you have already set up the server with a web server like Nginx or Apache.

# --- Configuration ---
# Replace with your server's IP address and user
SERVER_IP="47.239.60.239"
SERVER_USER="root"
# Replace with the path to your website's root directory on the server
REMOTE_DIR="/var/www/html"

# --- Deployment ---
echo "Deploying website to $SERVER_IP..."

# 1. (Optional) Build step - if you have any build process (e.g., for CSS or JS), run it here.

# 2. Sync files to the server using rsync
# rsync is efficient and only transfers changed files.
# The --delete option removes files from the server that are no longer in the local directory.
rsync -avz --delete ./* "$SERVER_USER@$SERVER_IP:$REMOTE_DIR/"

echo "Deployment complete."

# --- Post-deployment instructions ---
# 1. Make sure your domain minxingruyuan.com is pointing to your server's IP address (47.239.60.239).
# 2. Make sure your web server (Nginx or Apache) is configured to serve files from the REMOTE_DIR.
# 3. For Nginx, a sample configuration would look like this:
#
#    server {
#        listen 80;
#        server_name minxingruyuan.com www.minxingruyuan.com;
#
#        root /var/www/html;
#        index index.html;
#
#        location / {
#            try_files $uri $uri/ =404;
#        }
#    }
#
# 4. For Apache, you would use the DocumentRoot directive in your virtual host configuration.
# 5. After deploying, you may need to restart your web server for the changes to take effect.
#    - For Nginx: sudo systemctl restart nginx
#    - For Apache: sudo systemctl restart apache2
