#!/bin/bash

# Set user password as a variable
USER_PASSWORD="YourPasswordHere" # Change this to your preferred password

# Update and Upgrade Ubuntu
DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -y

# Install SSH server and configure for password login
DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd

# Create a non-root user with sudo privileges
useradd -m -s /bin/bash ubuntu
echo "ubuntu:$USER_PASSWORD" | chpasswd
usermod -aG sudo ubuntu

# Install Docker and dependencies without interaction
DEBIAN_FRONTEND=noninteractive apt-get install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
DEBIAN_FRONTEND=noninteractive apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y docker-ce docker-ce-cli containerd.io

# Allow the new user to run Docker commands without sudo
usermod -aG docker ubuntu

# Install Docker Compose
DOCKER_CONFIG=${DOCKER_CONFIG:-/home/ubuntu/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-$(uname -s)-$(uname -m) -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

# Install AWS CLI without interaction
DEBIAN_FRONTEND=noninteractive apt-get install -y awscli

# Restart to apply changes
reboot
