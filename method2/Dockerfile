FROM nginx:1.27

RUN chmod g+w /var/cache/nginx /var/run

COPY default.conf /etc/nginx/conf.d
COPY /html /usr/share/nginx/html

EXPOSE 8080
