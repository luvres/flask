## Flask with uWSGI and Python 3.8.7
### With Pandas, requests, openrouteservice, geopy, sklearn
-----

#### Pull image
```
docker pull izone/flask
```

#### Run
```
docker run -ti --rm --name Flask \
-p 5000:80 \
--mount type=bind,src=$HOME/1uvr3z/Azure/api,dst=/app \
izone/flask:smartfrete
```
#### Background
```
docker run -d --restart=always --name Flask \
-p 5000:80 \
--mount type=bind,src=$HOME/1uvr3z/Azure/api,dst=/app \
izone/flask:smartfrete
```

#### Access Browser
```
http://localhost:5000/
```

-----
#### Build
```
docker build -t izone/flask:proa ./proa/
```
#### Build develop
```
docker build -t izone/flask:smartfrete-develop -f ./smartfrete/Dockerfile_develop .
```
