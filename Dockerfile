ARG NGINX_VERSION=1.31.8
FROM nginx:${NGINX_VERSION}-alpine-slim

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]

