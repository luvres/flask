FROM alpine
MAINTAINER Leonardo Loures <luvres@hotmail.com>

## References:
# https://github.com/jazzdd86/alpine-flask
# https://github.com/publysher/docker-alpine-machine-learning

RUN \
	apk add --no-cache \
		bash \
		nginx \
		uwsgi \
		uwsgi-python3 \
  \
	&& pip3 install --upgrade pip \
	&& pip3 install flask \
  \
	&& chmod 777 /run/ -R \
	&& chmod 777 /root/ -R

EXPOSE 80

COPY nginx.conf /etc/nginx/nginx.conf
COPY app.ini /app.ini

CMD nginx && uwsgi --ini /app.ini