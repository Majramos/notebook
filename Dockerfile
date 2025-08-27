ARG PYTHON_VERSION

# call the operating system to be used
FROM python:${PYTHON_VERSION:-3.11}-slim

# SHELL ["/bin/bash", "-c"]
ENV SHELL=/bin/bash

# install the linux libraries needed
RUN apt-get update
RUN apt-get install -y nodejs vim nano
# clean temp files
RUN apt-get clean

ARG JUPYTERLAB_VERSION

# update pip and install necessary packages
# TODO: install python-dotenv
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install pip-tools jupyterlab==${JUPYTERLAB_VERSION:-4.2}

ENV PIP_DISABLE_PIP_VERSION_CHECK=1

# Arguments for user and group IDs
ARG UID=1000
ARG GID=1000

# Create a group and user with the provided IDs
RUN groupadd -g $GID pygroup
RUN useradd -rm -s /bin/bash -u $UID -g pygroup -G sudo pyuser

# make a user
# RUN useradd -rm -s /bin/bash -g root -G sudo pyuser
USER pyuser

RUN echo 'export PATH="$PATH:/home/pyuser/.local/bin"' >> home/pyuser/.bashrc
ENV PATH="$PATH:/home/pyuser/.local/bin"

# set a directory for the app
WORKDIR /home/pyuser/workspace

EXPOSE 8888

# launch the notebook as the entrypoint
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --notebook-dir=/home/pyuser/workspace --allow-root --NotebookApp.token='' --NotebookApp.password=''
