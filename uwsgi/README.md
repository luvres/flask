## uWSGI and Python 3.9 on arch amd64 and arm64
-----
#### Build
```
docker build -t izone/flask:uwsgi -f ./Dockerfile.amd64 .

docker build -t izone/flask:uwsgi-arm64 -f ./Dockerfile.arm64 .
```


