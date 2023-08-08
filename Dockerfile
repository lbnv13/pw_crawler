FROM python:3.6.0-alpine

WORKDIR /app
COPY . /app

RUN apk --no-cache --update add build-base && \
    pip install --no-cache-dir --upgrade pip \
    pip install --no-cache-dir -r /app/requirements.txt && \
    apk del build-base

ENV MONGO mongo_db
ENV MONGO_PORT 27017
ENV RMQ_HOST rabbitmq
ENV RMQ_USERNAME guest
ENV RMQ_PASSWORD guest
#ENV EXCLUDE_URLS '.*github.com'

ENTRYPOINT ["python3", "-u","crawler/crawler.py", "https://docs.gitlab.com/ee/"]