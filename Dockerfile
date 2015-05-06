FROM ubuntu:14.04

RUN apt-get -qq update

# Install php-fpm and nginx
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install curl php5 php5-fpm php5-cli php5-curl nginx

EXPOSE 80

# Add application directory
RUN mkdir -p /var/www
WORKDIR /var/www
COPY . /var/www/

COPY docker/nginx/default.conf /etc/nginx/sites-available/000-default.conf

# Start nginx.
CMD ["nginx", "-g", "daemon off;"]