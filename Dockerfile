FROM nginx:1.17

RUN chmod g+w /var/cache/nginx /var/run

COPY default.conf /etc/nginx/conf.d

EXPOSE 8080

#CMD ["/bin/bash"]