FROM nginx:1.29.3-alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
ADD trap_term.sh /usr/local/bin/

CMD [ "/usr/local/bin/trap_term.sh", "nginx", "-g", "daemon off;" ]

