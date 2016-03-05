# Create docker container
sudo docker build -t ubuntu_laravel .

# Create docker directory
#mkdir -pr ~/docker_fs

# Create ubuntu_laravel directory
mkdir -p ~/docker_fs/ubuntu_laravel

# Give user access to folder
sudo chown -R bart:users ~/docker_fs

# Run docker
sudo docker run -v ~/docker_fs/ubuntu_laravel:/var/www/example.com/public_html -p 8080:80 -t -i ubuntu_laravel /bin/bash
