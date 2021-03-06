## ICER-docker

### Docker installation (Ubuntu)
```
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

sudo systemctl start docker
sudo systemctl enable docker
sudo docker run hello-world
```

### Manage Docker as a non-root user
```
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

### NVIDIA
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html

### Developing inside the container
https://code.visualstudio.com/docs/remote/containers