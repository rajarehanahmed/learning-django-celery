FROM python:3.11.4-alpine

WORKDIR /usr/src/app

# prevent Python from writing pyc files to disc
ENV PYTHONDONTWRITEBYTECODE 1

# ensure Python ouput is sent straight to terminal
ENV PYTHONUNBUFFERED 1


RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install -r requirements.txt

COPY ./entrypoint.sh /usr/src/app/entrypoint.sh

COPY . /usr/src/app/
