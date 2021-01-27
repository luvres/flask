FROM alpine:3.13
MAINTAINER Leonardo Loures <leonardo@exacta.inf.puc-rio.br>

## References:
# https://github.com/jazzdd86/alpine-flask
# https://github.com/publysher/docker-alpine-machine-learning
# https://pkgs.alpinelinux.org/package/edge/community/x86/py3-scikit-learn

RUN \
	deps='python3-dev g++ gfortran lapack-dev postgresql-dev libxml2-dev libxslt-dev libffi-dev geos-dev' \
	&& apk add --no-cache \
			bash \
			nginx \
			uwsgi \
			uwsgi-python3 \
			lapack libstdc++ \
			libpq \
			libxslt \
			geos \
			\
			py3-pip \
			py3-pandas \
			py3-scikit-learn \
			${deps} \
  \
	&& pip3 install --upgrade pip \
	&& pip3 install --no-cache \
			flask \
			requests \
			openrouteservice \
			geopy \
			unidecode \
			sqlalchemy \
			marshmallow_sqlalchemy \
			psycopg2 \
			Scrapy \
			APScheduler \
			crochet \
			boltons \
			config-client \
			py-eureka-client \
			PyYAML \
			xlrd \
			flask_cors \
			flask_jwt_extended \
			geoalchemy2 \
			Shapely \
			XlsxWriter \
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
