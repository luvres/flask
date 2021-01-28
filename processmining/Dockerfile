FROM alpine:3.13
MAINTAINER Leonardo Loures <leonardo@exacta.inf.puc-rio.br>

## References:
# https://github.com/jazzdd86/alpine-flask
# https://github.com/publysher/docker-alpine-machine-learning
# https://pkgs.alpinelinux.org/package/edge/community/x86/py3-scikit-learn
# https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver15
# https://stackoverflow.com/questions/57724082/how-do-i-install-msodbcsql17-driver-for-alpine-linux

RUN \
	deps='python3-dev g++ gfortran lapack-dev postgresql-dev libxml2-dev libxslt-dev libffi-dev geos-dev build-base unixodbc-dev freetds-dev curl gnupg' \
	&& apk add --no-cache \
			bash \
			nginx \
			uwsgi \
			uwsgi-python3 \
			unixodbc \
		\
			${deps} \
		\
			py3-pip \
			py3-scipy \
			py3-numpy \
			py3-pandas \
  \
  # Download the desired package(s)
	&& curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.6.1.1-1_amd64.apk \
	&& curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_17.6.1.1-1_amd64.apk \
	\
	# (Optional) Verify signature, if 'gpg' is missing install it using 'apk add gnupg':
	&& curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.6.1.1-1_amd64.sig \
	&& curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_17.6.1.1-1_amd64.sig \
	\
	&& curl https://packages.microsoft.com/keys/microsoft.asc  | gpg --import - \
	&& gpg --verify msodbcsql17_17.6.1.1-1_amd64.sig msodbcsql17_17.6.1.1-1_amd64.apk \
	&& gpg --verify mssql-tools_17.6.1.1-1_amd64.sig mssql-tools_17.6.1.1-1_amd64.apk \
	\
	# Install the package(s)
	&& apk add --allow-untrusted msodbcsql17_17.6.1.1-1_amd64.apk \
	&& apk add --allow-untrusted mssql-tools_17.6.1.1-1_amd64.apk \
	&& rm ms* \
  \
	&& pip3 install --upgrade pip \
	&& pip3 install --no-cache \
			flask \
			graphviz \
			pyodbc \
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
