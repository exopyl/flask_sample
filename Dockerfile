FROM alpine:3.16.0
MAINTAINER exopyl
LABEL version="0.1"

RUN apk add --no-cache bash python3
RUN python3 -m ensurepip
RUN pip3 install --upgrade pip
RUN pip3 install flask

ENV APP_DIR /app

# app dir
RUN mkdir ${APP_DIR}
WORKDIR ${APP_DIR}

# expose web server port
# only http, for ssl use reverse proxy
EXPOSE 5000

COPY main.py /app

# exectute start up script
ENTRYPOINT ["python3", "/app/main.py"]

