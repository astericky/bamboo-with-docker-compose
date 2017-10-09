FROM cptactionhank/atlassian-bamboo

USER root
RUN curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
 && chmod +x /usr/local/bin/docker-compose

#Originally this image was run as daemon:daemon, but in order to spawn docker containers we have to
#either expose docker via IP and PORT or mount /var/run/docker.sock
#Since by default docker is configured with /var/run/docker.sock and does not expose API via IP
#we're using volume approach, but that file is owned by root, so we need to run as root
