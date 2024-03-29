# Dockerfile

# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
FROM python:3.8-slim

# loads db libs
RUN apt-get update
RUN apt-get install -y default-mysql-client libmariadb-dev
RUN apt-get install -y libmariadb-dev-compat gcc gdal-bin libjpeg-dev
#libmariadb-dev-compat libmariadbclient-dev python3-dev gdal-bin python3-mysqldb libssl-dev libjpeg-dev gcc


# Allows docker to cache installed dependencies between builds
COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt


# Mounts the application code to the image
COPY . code
# avoids env confs to be installed
#RUN rm /code/BorsaDeTreball/.env
#RUN rm -rf /code/env*

# establish workdir
WORKDIR /code

EXPOSE 8000 8001

# runs the production server
ENTRYPOINT ["/code/run.sh"]
