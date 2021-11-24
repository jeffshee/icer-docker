# For more information, please refer to https://aka.ms/vscode-docker-python
FROM anibali/pytorch:1.8.1-cuda11.1

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

ENV TZ=Asia/Tokyo
RUN sudo -i
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install dependencies
RUN sudo apt-get update 
RUN sudo apt-get install mecab libmecab-dev -y
RUN sudo apt-get install graphviz libgraphviz-dev -y

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

WORKDIR /app
COPY . /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
# RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
# USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["python", "app.py"]
