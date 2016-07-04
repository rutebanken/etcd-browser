FROM ubuntu:14.04

MAINTAINER Christoph Wiechert <wio@psitrax.de>
MAINTAINER https://github.com/henszey

RUN apt-get update
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y nodejs

RUN mkdir /app
ADD . /app/
WORKDIR /app/frontend

# Downloading dependencies to avoid 3rd-party cookies
ADD https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js jquery.min.js
ADD https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.20/angular.min.js angular.min.js
ADD https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.20/angular-cookies.min.js angular-cookies.min.js
ADD https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/css/bootstrap.min.css bootstrap.min.css
ADD https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/css/bootstrap-theme.min.css bootstrap-theme.min.css
ADD https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/js/bootstrap.min.js bootstrap.min.js

WORKDIR /app
EXPOSE 8000

CMD ["nodejs", "server.js"]
