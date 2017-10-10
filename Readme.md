# Bamboo with docker-compose

Create volume with proper permissions:

    mkdir -p /var/atlassian/bamboo
    chmod a+rwx /var/atlassian/bamboo
    
Start bamboo container:

    docker-compose up

## Configuring job

During adding tasks you might need to add new executable (docker-compose), or you can do it here
http://localhost:8085/admin/agent/viewBuilders.action

    Path: /usr/local/bin/docker-compose

I suggest to separate lint and tests into 2 separate tasks so that linting problems could be detected without
waiting for dependencies like ElastiSsearch or Mongo.

### Tasks:
* Main tasks
    * Source Code Checkout configuration
    * Build image (command: docker-compose, argument: build)
    * Lint (command: docker-compose, argument: up --build --abort-on-container-exit --exit-code-from lint lint)
    * Tests (command: docker-compose, argument: up --build --abort-on-container-exit --exit-code-from tests tests)
* Final tasks
    * Mocha Test Parser configuration (Testfile pattern: mocha.json, Working subdirectory: output)
    * Cleanup containers (command: docker-compose, argument: down)
    
You can find sample project compatible with this setup here https://github.com/blabno/bamboo-sample-project.
