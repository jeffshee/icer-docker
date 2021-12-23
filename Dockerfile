# For more information, please refer to https://aka.ms/vscode-docker-python
FROM anibali/pytorch:1.8.1-cuda11.1

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

ENV TZ=Asia/Tokyo
RUN sudo sh -c "ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone"

# Update
RUN sudo apt-get update &&               \
    sudo apt-get upgrade -y &&           \
    sudo apt-get dist-upgrade -y

# Install dependencies
RUN sudo apt-get install build-essential -y
RUN sudo apt-get install cmake -y
RUN sudo apt-get install mecab libmecab-dev -y
RUN sudo apt-get install graphviz libgraphviz-dev -y
RUN sudo apt-get install ffmpeg -y
RUN sudo apt-get install gcc-8 -y

# Install libcudnn8, nvidia-cuda-toolkit
RUN sudo apt-get install libcudnn8 nvidia-cuda-toolkit -y
# RUN curl -O https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/libcudnn8_8.1.1.33-1+cuda11.2_amd64.deb
# RUN sudo dpkg -i ./libcudnn8_8.1.1.33-1+cuda11.2_amd64.deb

# Install Qt5, Ref: https://github.com/theshadowx/Qt5_Docker/blob/default_qt5_focal/Dockerfile
RUN sudo apt-get install -y        \
        git                        \
        wget                       \
        xvfb                       \
        flex                       \
        dh-make                    \
        debhelper                  \
        checkinstall               \
        fuse                       \
        # snapcraft                  \
        bison                      \
        libxcursor-dev             \
        libxcomposite-dev          \
        software-properties-common \
        build-essential            \
        libssl-dev                 \
        libxcb1-dev                \
        libx11-dev                 \
        libgl1-mesa-dev            \
        libudev-dev                \
        qt5-default                \
        qtbase5-private-dev

RUN sudo apt-get clean

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
CMD ["python"]
