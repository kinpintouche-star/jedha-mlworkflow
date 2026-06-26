# Build a python 3.10 image
FROM python:3.10

# THIS IS SPECIFIC TO HUGGINFACE
# We create a new user named "user" with ID of 1000
# We switch from "root" (default user when creating an image) to "user" 
# We set two environmnet variables 
# so that we can give ownership to all files in there afterwards
# we also add /home/user/.local/bin in the $PATH environment variable 
# PATH environment variable sets paths to look for installed binaries
# We update it so that Linux knows where to look for binaries if we were to install them with "user".
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH

# Copy and install dependencies 
COPY requirements.txt /requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r /requirements.txt

# Launch mlflow server 
# Here we chose to have $PORT as environment variable but you could have hard coded 7860 
# If you are sure to push into production 
# Advantage to use an env variable is that your code is more portable if you were to deploy to another 
# type of server
CMD mlflow ui -p $PORT \
--host 0.0.0.0
# --allowed-hosts charlestng-dsfsft-39-mlflow-charles.hf.space \ 
# replace with your 
# --cors-allowed-origins "https://charlestng-dsfsft-39-mlflow-charles.hf.space" \
# --backend-store-uri $BACKEND_STORE_URI \
# --default-artifact-root $ARTIFACT_STORE_URI

# Read the doc: https://huggingface.co/docs/hub/spaces-sdks-docker
# you will also find guides on how best to write your Dockerfile
