# docker-node-db
nginx - nodejs  - mariadb - phpmyadmin
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

SSH into a running container
```
docker exec -it containerID bash
```

### Docker Compose
```
docker-compose up --build -d
docker-compose down -v
```

### Local
- set hosts
```
sudo vi /etc/hosts
sudo source /etc/hosts
```