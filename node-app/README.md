# Node Project

1. Create Your Project
2. Set Dockerfile
3. Set docker-compose.yml
```
node-app:
  container_name: node_app
  build:
    context: ./project-folder
    dockerfile: Dockerfile
  volumes:
    - ./project-folder:/usr/src/app
    - /usr/src/app/node_modules
    - /usr/src/app/build
  restart: always
```
