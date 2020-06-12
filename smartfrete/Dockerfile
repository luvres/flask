FROM alpine:3.11
MAINTAINER Leonardo Loures <luvres@hotmail.com>

## References:
# https://github.com/jazzdd86/alpine-flask
# https://github.com/publysher/docker-alpine-machine-learning

RUN \
	deps='python3-dev g++ gfortran lapack-dev postgresql-dev libxml2-dev libxslt-dev libffi-dev' \
	&& apk add --no-cache \
		bash \
		nginx \
		uwsgi \
		uwsgi-python3 \
		lapack libstdc++ \
		libpq \
		libxslt \

	  \
		${deps} \
  \
	&& pip3 install --upgrade pip \
	&& pip3 install --no-cache \
				flask \
#				pandas \
				requests \
				openrouteservice \
				geopy \
				unidecode \
				sqlalchemy \
				marshmallow_sqlalchemy \
				psycopg2 \
				Scrapy \
  \
	&& chmod 777 /run/ -R \
	&& chmod 777 /root/ -R \
  \
	&& apk del ${deps} \
	&& rm -rf /root/.cache

EXPOSE 80

COPY nginx.conf /etc/nginx/nginx.conf
COPY app.ini /app.ini

CMD nginx && uwsgi --ini /app.ini
