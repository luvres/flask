## Flask with uWSGI and Python 3.9.7 on Alpine
### With Pandas, Numpy, requests, pymongo
-----

#### Pull image
```
izone/flask:profarma
```

#### Run
```
docker run -ti --rm --name Flask \
-p 5000:80 \
--mount type=bind,src=$HOME/1uvr3z/Azure/api,dst=/app \
izone/flask:profarma
```
#### Background
```
docker run -d --restart=always --name Flask \
-p 5000:80 \
--mount type=bind,src=$HOME/1uvr3z/Azure/api,dst=/app \
izone/flask:profarma
```

#### Access Browser
```
http://localhost:5000/
```

-----
#### Build
```
docker build -t izone/flask:profarma -f ./profarma/Dockerfile .

docker build -t izone/flask:profarma-arm64 -f ./profarma/Dockerfile.arm64 .

```


