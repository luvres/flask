## Flask with uWSGI and Python 3.6
### into Alpine OS (66.7MB) in amd64 and armhf too
### With Pandas, Numpy and Sklearn (321MB)
### running on my Raspberry PI
-----

#### Pull image
```
docker pull izone/flask
```

#### Run
```
docker run -ti --rm --name Flask \
-p 8080:80 \
-v $HOME/1uvr3z/_:/app \
izone/flask
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
docker build -t izone/flask:ml ./ml/
```
```
docker build -t izone/flask:nginx ./nginx/
```
```
docker build -t izone/flask:nginx-ml ./nginx/ml/
```

-----
### Running on my Raspberry PI 3
```
docker build -t izone/flask:armhf ./armhf/
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
docker build -t izone/flask:armhf ./armhf/
```
```
docker build -t izone/flask:armhf-ml ./armhf/ml/
```