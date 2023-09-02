# Initial Server

# Pre-Install Docker
#docker 
-  install packages to allow apt to use a repository over HTTPS
	- `sudo apt update && sudo apt upgrade`
	- `sudo apt-get install ca-certificates curl gnupg`
- Add Docker's official GPG key
	- `sudo install -m 0755 -d /etc/apt/keyrings`
	- `curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg`
	- `sudo chmod a+r /etc/apt/keyrings/docker.gpg`
- set up the repository
```
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
- `sudo apt update && sudo apt upgrade`

# Install Docker
- install the latest version of docker
	- `sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`

## Test Docker
- `sudo docker run hello-world`
