FROM alpine:3.13
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
		py3-pip \
  \
	&& pip install --upgrade pip \
	&& pip install --no-cache \
			flask \
  \
	&& chmod 777 /run/ -R \
	&& chmod 777 /root/ -R \
  \
	&& rm -rf /root/.cache

EXPOSE 80

COPY nginx.conf /etc/nginx/nginx.conf
COPY app.ini /app.ini

CMD nginx && uwsgi --ini /app.ini
