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

SSH into a running container
```
docker exec -it containerID bash
```

### Docker Compose
```
docker-compose up --build -d
docker-compose down -v
```
---

### Local
- set hosts
```
sudo vi /etc/hosts
sudo source /etc/hosts
```
---