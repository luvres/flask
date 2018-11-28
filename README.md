## Flask with uWSGI and Python 3.6
### into Alpine OS (66.7MB)
#### All credits for Christian Gatzlaff in https://github.com/jazzdd86/alpine-flask
-----

### Pull image
```
docker pull izone/flask
```

### Run
```
docker run -ti --rm --name Flask \
-p 8080:80 \
-v $HOME/1uvr3z/_:/app \
izone/flask
```
##### Background
```
docker run -d --restart=always --name Flask \
-p 8080:80 \
-v $HOME/1uvr3z/_:/app \
izone/flask
```

-----
### Access Browser
```
http://localhost:8080/
```

-----
### Build
```
docker build -t izone/flask .
```

##### arrmhf
```
docker build -t izone/flask:armhf ./armhf/
```
