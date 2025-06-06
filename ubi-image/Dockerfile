FROM registry.access.redhat.com/ubi9/nginx-126

COPY nginx.conf /etc/nginx/nginx.conf
COPY /html/ .

EXPOSE 8080

CMD [ "nginx", "-g", "daemon off;"]
