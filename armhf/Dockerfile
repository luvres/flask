FROM izone/arm:alpine
MAINTAINER Leonardo Loures <luvres@hotmail.com>

# sudo apt-get install qemu-user-static binfmt-support
# sudo update-binfmts --enable qemu-arm
# sudo update-binfmts --display qemu-arm 
# cp /usr/bin/qemu-arm-static .
COPY qemu-arm-static /usr/bin/qemu-arm-static

## References:
# https://gist.github.com/berndhahnebach/38d5bfe73134928c0a1ad001a94df05f
# https://github.com/berndhahnebach/Netgen
# https://sourceforge.net/p/netgen-mesher/wiki/Home/
# https://aur.archlinux.org/packages
# http://www.boost.org/doc/libs/1_64_0/more/getting_started/unix-variants.html
# https://matchboxdorry.gitbooks.io/matchboxblog/content/blogs/build_and_run_arm_images.html
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