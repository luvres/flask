FROM alpine:3.14
MAINTAINER Leonardo Loures <leonardo@exacta.inf.puc-rio.br>

## References:
# https://github.com/jazzdd86/alpine-flask
# https://github.com/publysher/docker-alpine-machine-learning
# https://pkgs.alpinelinux.org/package/edge/community/x86/py3-scikit-learn

ENV UWSGI_MODULE="app:app" \
		PYTHONPATH=/app

RUN \
	deps='g++ gfortran lapack-dev postgresql-dev libxml2-dev libxslt-dev libffi-dev geos-dev' \
	&& apk add --no-cache \
			bash \
			nginx \
			uwsgi \
			uwsgi-python3 \
			py3-pip \
		\
			${deps} \
		\
			lapack libstdc++ \
			libpq \
			libxslt \
			geos \
			py3-pandas \
			py3-scikit-learn \
  \
	&& pip install --upgrade pip \
	&& pip install --no-cache \
			flask \
			flask_cors \
			flask_jwt_extended==3.25.1 \
			sqlalchemy \
			marshmallow_sqlalchemy==0.25.0 \
			psycopg2-binary \
			unidecode \
			openpyxl \
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
