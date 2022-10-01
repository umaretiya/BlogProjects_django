# base image 
FROM python:3.10

# File Author / Maintainer

ADD . /index

# set the default directory where CMD will execute
WORKDIR /BlogProject_django

COPY ./requirements.txt .

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DEBUG 0

# # install psycopg2
# RUN apk update \
#     && apk add --virtual build-essential gcc python3-dev musl-dev \
#     && apk add postgresql-dev \
#     && pip install psycopg2


# install dependencies
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy project
COPY . .

# add and run as non-root user
# RUN adduser -D myuser
# USER myuser

# run gunicorn
# CMD gunicorn portfolio.wsgi:application --bind 0.0.0.0:$PORT

# Get pip to download and install requirements:

# Expose ports
EXPOSE $PORT

# CMD exec gunicorn portfolio.wsgi:application --bind 0.0.0.0:8000 --workers 3


# docker build -t django_application_image .
# $ sudo docker run -p 8000:8000 -i -t django_application_image
# heroku config:set SECRET_KEY=djangoapp -a django-regress
# django-regress

# ENTRYPOINT [  ]
# CMD [ "manage.py","runserver" ]
EXPOSE 8000

CMD [ "python","manage.py", "runserver", "0.0.0.0:8000" ]

# docker run --name blog -d -p 8000:8000 blog:latest