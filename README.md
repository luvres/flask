## Flask with uWSGI and Python 3.8.7
### into Alpine OS (75.9MB) in amd64 and armhf too
### With Pandas, Numpy, Scipy and Sklearn (341MB)
### running on my Raspberry PI
-----
			
#### Pull image
```
docker pull izone/flask
```

#### Run
```
docker run --rm --name app \   
-p 8080:80 \
-e PYTHONPATH=/app \
-e UWSGI_MODULE="app:app" \
-v $HOME/1uvr3z/_:/app \
-ti izone/flask
```
```
docker run --rm --name app \   
-p 8080:80 \
-e PYTHONPATH=/app \
-e UWSGI_MODULE="app:create_app()" \
-v $HOME/1uvr3z/_:/app \
-ti izone/flask
```
#### Background
```
docker run -d --restart=always --name Flask \
-p 8080:80 \
-v $HOME/1uvr3z/_:/app \
izone/flask:nginx-ml
```

#### Access Browser
```
http://localhost:8080/
```

#### Build
```
docker build -t izone/flask .
```
```
docker build -t izone/flask:pandas ./pandas/
```
```
docker build -t izone/flask:ml ./ml/
```
```
docker build -t izone/flask:processmining ./processmining/
```
```
docker build -t izone/flask:smartfrete ./smartfrete/
```
-----
```
docker build -t izone/flask:nginx ./nginx/
```
```
docker build -t izone/flask:nginx-ml ./nginx/ml/
```
```
docker build -t izone/flask:build ./build/
```
```
docker build -t izone/flask:alpine-3.11 -f Dockerfile_old .
```
-----
### Running on my Raspberry PI 3
```
docker build -t izone/flask:armhf ./armhf/
```
```
docker build -t izone/flask:armhf-pandas ./armhf/pandas/
```
```
docker run -d --restart=always --name Flask \
-p 8080:80 \
-v $HOME/1uvr3z/_:/app \
izone/flask:armhf
```

### Docker QEMU
#### armhf in amd64
```
sudo apt-get install qemu-user-static
```

#### Build
```
sudo apt-get install qemu-user-static binfmt-support
sudo update-binfmts --enable qemu-arm
sudo update-binfmts --display qemu-arm 
cp /usr/bin/qemu-arm-static .
```
```
docker build -t izone/flask:armhf_qemu ./armhf_qemu/
```
```
docker build -t izone/flask:armhf_qemu-ml ./armhf_qemu/ml/
```
