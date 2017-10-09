# Bamboo with docker-compose

Create volume with proper permissions:

    mkdir -p /var/atlassian/bamboo
    chmod a+rwx /var/atlassian/bamboo
    
Start bamboo container:

    docker-compose up
