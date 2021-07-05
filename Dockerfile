# syntax=docker/dockerfile:1

# pull official base image
FROM python:3.8-slim-buster

# set working directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV FLASK_APP ./app/main.py

# install system dependencies
RUN apt-get update \
  && apt-get -y install netcat gcc \
  && apt-get clean

# install dependencies
RUN pip3 install --upgrade pip
COPY ./requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# add app
COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
