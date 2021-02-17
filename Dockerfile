# Dockerfile

# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
FROM python:3.8-slim

# loads db libs
RUN apt-get update
RUN apt-get install -y libmariadb-dev libmariadbclient-dev python3-dev gdal-bin python3-mysqldb libssl-dev postgresql-server-dev-all postgresql-common libjpeg-dev python-psycopg2 gcc


# Allows docker to cache installed dependencies between builds
COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt


# Mounts the application code to the image
COPY . code
WORKDIR /code

COPY BorsaDeTreball/settings2example.py BorsaDeTreball/settings2.py

EXPOSE 8000

# runs the production server
ENTRYPOINT ["python", "manage.py"]
CMD ["runserver", "0.0.0.0:8000"]
