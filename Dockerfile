ARG VERSION=16.04
FROM ubuntu:$VERSION
WORKDIR /var/www/python/
COPY hello.py .
RUN apt-get update && apt-get install -y \
python3.5 \
python3.5-dev \
python3-pip \
&& pip3 install \
--upgrade pip \
setuptools \
uwsgi \
&& apt-get remove -y \
python3.5-dev \
&& apt-get remove -y \
python3.5-dev \
python3-setuptools \
python3-pip 
EXPOSE 80/tcp
CMD uwsgi --wsgi-file hello.py --http :80
