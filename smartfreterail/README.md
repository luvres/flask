## Flask with uWSGI and Python 3.8.7
### With Pandas, requests, openrouteservice, geopy, sklearn
-----

#### Pull image
```
docker pull izone/flask:smartfreterail
```

#### Run
```
docker run -ti --rm --name Flask \
--net=host \
-p 5000:80 \
-e PYTHONPATH=/app \
-e UWSGI_MODULE="app:app" \
--mount type=bind,src=$HOME/1uvr3z/Azure/Smartfrete/SmartFreightRail,dst=/app \
izone/flask:smartfreterail
```
#### Background
```
docker run -d --restart=always --name Flask \
-p 5000:80 \
-e PYTHONPATH=/app \
-e UWSGI_MODULE="app:app" \
--mount type=bind,src=$HOME/1uvr3z/Azure/api,dst=/app \
izone/flask:smartfreterail
```

#### Access Browser
```
http://localhost:5000/
```

-----
#### Build
```
docker build -t izone/flask:smartfreterail ./smartfreterail/
```


