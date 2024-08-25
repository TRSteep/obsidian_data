#telegram #bot #docker #dev #devops

# Installing Docker
- https://docs.docker.com/engine/install/ubuntu/

## Configure docker
### Set up Docker's apt repository
```bash
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

### Install the Docker packages
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### Verify that the Docker Engine installation is successful by running the hello-world image
```bash
sudo docker run hello-world
```

# Python bot Project
## Clone the Project
clone the sample Telegram bot project with the following command
```bash
git clone https://github.com/tjtanjin/tele-qr.git
```

## Setup the Project 
in main.py change BOT_TOKEN
```python
def main():
    """
    Handles the initial launch of the program (entry point).
    """
    token = os.getenv("BOT_TOKEN")
```

# Configure docker container
## Create a Dockerfile 
It's contain instructions for Docker on how to build your container

### Create an empty Dockerfile
- `touch Dockerfile`

### Adding the base image
The first line in the Dockerfile specifies the base image that our container will use
- `nano Dockerfile`
```python
FROM python:3.10.12
```

### Setting the working directory
The working directory inside the docker container where our application code will reside
```python
WORKDIR /usr/src/app
```

### Copying files into the container
we need to copy all the files from our local directory into the container which includes our Python scripts, requirements file, and any other project files
- `COPY` - command
- first `.` - represents our current project directory
- second `.` - represents the docker container's working directory
```python
COPY . .
```

### Creating a directory
Run command to create directory
```python
RUN mkdir ./images
```

### Installing dependencies
All dependencies required by our Python application listed in **requirements.txt**
```python
RUN pip install - no-cache-dir -r requirements.txt
```

install the python-telegram-bot package with the [job-queue]
```python
RUN pip install python-telegram-bot[job-queue]
```

### Specifying the command to run the application:
Finally, we specify the command that should be executed when the container starts
```python
CMD ["python", "-u", "./main.py"]
```

## Build & Run container
### Run first time
first build our docker image with docker build
```bash
docker build -t my_telegram_bot .
```
- This process may take a while the first time
- command essentially reads the instructions from your Dockerfile and builds a Docker image with it
- feel free to replace my_telegram_bot with whatever you wish to name your Docker image.

### Run container usually
Once the Docker image is built, we can then finally run our Docker container with docker run
```bash
docker run my_telegram_bot
```

useful basic Docker commands to know
- `docker run -d <image_id_or_name>` - to run the Docker container in detached mode
- `docker ps` - to list all running containers
- `docker stop <container_id_or_name>` - to stop a running container
- `docker rm <container_id_or_name>` - to remove a container
- `docker images` - to list all images
- `docker rmi <image_id_or_name>` - to remove an image
- `docker logs <container_id_or_name>` - to view the logs of a container

---
# Info
- https://tjtanjin.medium.com/automating-telegram-bot-deployment-with-github-actions-and-docker-482abcd2533e
- https://selesnow.github.io/build_telegram_bot_using_r/%D1%83%D0%BF%D0%B0%D0%BA%D0%BE%D0%B2%D1%8B%D0%B2%D0%B0%D0%B5%D0%BC-%D0%B1%D0%BE%D1%82%D0%B0-%D0%B2-docker-%D0%BA%D0%BE%D0%BD%D1%82%D0%B5%D0%B9%D0%BD%D0%B5%D1%80.html
- https://tproger.ru/articles/telegram-bot-create-and-deploy

# Tools
- https://github.com/ADDrey/telegram-bot-in-docker