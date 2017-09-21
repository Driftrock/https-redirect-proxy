FROM nginx:mainline-alpine

COPY default.conf /etc/nginx/conf.d/
ADD trap_term.sh /usr/local/bin/

CMD [ "/usr/local/bin/trap_term.sh", "nginx", "-g", "daemon off;" ]

