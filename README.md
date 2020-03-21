# docker-node-db
This docker-compose run container
1. nginx 
2. mariadb / mysql
3. phpmyadmin
4. nodejs
---
## Docker Command

### Docker
prune image and container
```
docker image prune
docker container prune
```

show images and delete
```
docker images
docker rmi -f id
```

show all container
```
docker ps -a 
```

show logs
```
docker logs -f name
```

SSH into a running container
```
docker exec -it containerName bash
```

### Docker Compose
```
docker-compose up --build -d
docker-compose down -v
```
---

## On Local
1. Change server_name
- location file
```
cd docker/web/lb/nginx/conf/vhosts
vi app.conf
```
- change server_name
```
upstream web {
    server node-app:3000;
}

upstream phpmyadmin {
    server phpmyadmin;
}

server {
    listen 8080;

    server_name node-app.local;

    ...
}

server {
    listen 8080;

    server_name node-app-db.local;

    ...
}
```

2. set hosts
```
sudo vi /etc/hosts
sudo source /etc/hosts
```

```
##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
...

# Example
127.0.0.1       node-app.local
127.0.0.1       node-app-db.local

...
# End of section
```
---

## On Server

1. install docker
[install docker-compose] (https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-18-04)
[install docker-ce on ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

2. Clone Docker this Project
```
git clone https://github.com/Thammasok/docker-node-db.git
```
If you split the project, clone that project as well.
```
cd docker-node-db
git clone your git project
```
and change folder path in build context and volumes
```
node-app:
    container_name: node_app
    build:
        context: ./project-folder
        dockerfile: Dockerfile
    volumes:
        - ./project-folder:/usr/src/app
    ...
```

3. Allow Permission dockers folder
```
chmod -R 777 dockers
chmod 777 clearScript.sh
chmod 777 composer-update.sh
chmod 777 delete-initial.sh
```

4. Delete initial file
```
./delete-initial.sh
```

5. Set domain name and Sub domain
```
Example
- domain.com -> website
- pma.domain.com -> phpmyadmin
```

6. Change server_name
- location file
```
cd docker/web/lb/nginx/conf/vhosts
vi app.conf
```
- change server_name
```
upstream web {
    server node-app:3000;
}

upstream phpmyadmin {
    server phpmyadmin;
}

server {
    listen 8080;

    server_name domain.com;

    ...
}

server {
    listen 8080;

    server_name pma.domain.com;

    ...
}
```

7. Set Environment file (.env) in Docker and Project
```
cp .env.example .env
vi .env
```

8. Start Docker compose
```
docker-compose up --build -d
```
---