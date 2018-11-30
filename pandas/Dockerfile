FROM alpine
MAINTAINER Leonardo Loures <luvres@hotmail.com>

## References:
# All credits for Christian Gatzlaff in https://github.com/jazzdd86/alpine-flask

RUN \
	apk add --no-cache \
		bash \
		nginx \
		uwsgi \
		uwsgi-python3 \
	  \
		python3-dev g++ \

  \
	&& pip3 install --upgrade pip \
	&& pip3 install --no-cache \
				flask \
				pandas \
  \
	&& chmod 777 /run/ -R \
	&& chmod 777 /root/ -R

EXPOSE 80

COPY nginx.conf /etc/nginx/nginx.conf
COPY app.ini /app.ini

CMD nginx && uwsgi --ini /app.ini