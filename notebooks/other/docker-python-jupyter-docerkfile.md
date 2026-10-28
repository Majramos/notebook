# Setup a python with jupyter environment with docker

Create a `Dockerfile` in your Python app project
```
# call the operating system to be used
FROM python:3.12-slim

# install the linux libraries needed
RUN apt-get update
# git and pyodbc build dependencies
RUN apt-get install -y gcc+ g++ unixodbc-dev git nodejs
RUN apt-get clean

# update pip and install necessary packages
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install jupyterlab

ENV PIP_DISABLE_PIP_VERSION_CHECK=1

# set a directory for the app
WORKDIR /workspace

EXPOSE 8888

# launch the notebook as the entrypoint
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --notebook-dir=/workspace --allow-root --NotebookApp.token='' --NotebookApp.password=''
```

Build and run the Docker image
```bash
$ docker build -t python-jupyterlab .
$ docker run -it --rm --name my-dev-environment python-jupyterlab
```