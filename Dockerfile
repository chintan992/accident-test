#  creates a layer from the base Docker image.
FROM python:3.6.15
 
# https://shouldiblamecaching.com/
ENV PIP_NO_CACHE_DIR 1
 

RUN apt -qq update
# base required pre-requisites before proceeding ...
RUN apt -qq install -y --no-install-recommends \
    curl \
    git \
    gnupg2 \
    unzip \
    wget

# add required files to sources.list
ENV LANG C.UTF-8

# For Upgrading Setup Tool
RUN pip3 install --upgrade pip setuptools

# install requirements, inside the container
RUN pip3 install -U --no-cache-dir -r requirements.txt

# specifies what command to run within the container.
CMD ["python3", "main.py"]