FROM nginx:1.27-alpine
RUN apk add --no-cache bash envsubst
ENV LISTEN_PORT=8080
# copy template and entrypoint
COPY nginx.conf.template /etc/nginx/templates/nginx.conf.template
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
EXPOSE 8080
CMD ["/docker-entrypoint.sh"]
