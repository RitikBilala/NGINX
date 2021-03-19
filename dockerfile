FROM ubuntu
# Install Nginx.
RUN \
apt-get update && \
apt-get install -y nginx && \
rm -rf /var/lib/apt/lists/* && \
echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
chown -R www-data:www-data /var/lib/nginx
# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d","/var/log/nginx", "/var/www/html"]
# Define the working directory.
WORKDIR /etc/nginx
# Define default command.
ENTRYPOINT ["/bin/sh", "-c" , "echo $(hostname -I) >>/var/www/html/index.html && nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
