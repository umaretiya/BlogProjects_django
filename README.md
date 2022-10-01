
### Docker file for Django
```
# pull official base image
FROM python:3.10-alpine

# set work directory
WORKDIR /app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DEBUG 0

# install psycopg2
RUN apk update \
    && apk add --virtual build-essential gcc python3-dev musl-dev \
    && apk add postgresql-dev \
    && pip install psycopg2

# install dependencies
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy project
COPY . .

# add and run as non-root user
RUN adduser -D myuser
USER myuser

# run gunicorn
CMD gunicorn hello_django.wsgi:application --bind 0.0.0.0:$PORT
```
django_image 

$ docker build -t web:latest .
$ docker run -d --name django-heroku -e "PORT=8765" -e "DEBUG=1" -p 8007:8765 web:latest


docker run -p 8000:8000 -d flask_docker

heroku container:push web --app django-regress

dj-port repor docker



pushing images/containers/repo : 

docker tag flask_docker <your-docker-hub-username>/flask-docker
docker push <your-docker-hub-username>/flask-docker


heroku app flask-fsweb name
command :
heroku login
heroku container:login
docker login --username=<your-username> --password=<your-password>
heroku create <app-name>

heroku container:push web --app <app-name>
heroku container:release web --app <app-name>


CMD [ "python", "./manage.py runserver 0.0.0.0:8000" ]


$ docker build -t registry.heroku.com/dj-port-8000/web .
$ docker push registry.heroku.com/dj-port-8000/web
$ heroku container:release -a dj-port-8000 web

$ heroku stack:set container -a dj-port-8000

# https://github.com/veryacademy/docker-mastery-with-django

docker build -t <image name>:<tag>
docker image build -t <flask_docker> .

docker run -p 5000:5000 -d <webscrap>
remot docker repo 9909868/flaskwebscrap
docker ps

docker stop <container id>
```
pushing image 


docker tag flask_docker <your-docker-hub-username>/flask-docker
docker push <your-docker-hub-username>/flask-docker


heroku app flask-fsweb name
command :
heroku login
heroku container:login
docker login --username=<your-username> --password=<your-password>
heroku create <app-name>

heroku container:push web --app <app-name>
heroku container:release web --app <app-name>



echo "# git_repo" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/umaretiya/flask_FSDS.git
git push -u origin main


### force fully push
git remote add origin-push https://github.com/umaretiya/flask_FSDS.git
git fetch origin-push

git push --force-with-lease origin-push