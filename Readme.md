# Bamboo with docker-compose

Expose docker API on `172.17.0.1:2376` or change `DOCKER_HOST` in `docker-compose.yml`.

Create volume with proper permissions:

    mkdir volume
    chmod a+rwx volume
    
Start bamboo container:

    docker-compose up
