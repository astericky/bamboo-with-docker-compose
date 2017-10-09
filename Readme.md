# Bamboo with docker-compose

Expose docker API on `172.17.0.1:2376` or change `DOCKER_HOST` in `docker-compose.yml`.

Create volume with proper permissions:

    mkdir -p /var/atlassian/bamboo
    chmod a+rwx /var/atlassian/bamboo
    
Start bamboo container:

    docker-compose up
