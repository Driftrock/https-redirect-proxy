FROM nginx:1.31.8-alpine-slim

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]

