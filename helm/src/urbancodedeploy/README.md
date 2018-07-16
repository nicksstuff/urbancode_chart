# A Chart for UrbanCode Deploy

```bash
docker build -t "ucds" ./server
docker build -t "ucda" ./agent
```


```bash
docker network create --subnet=172.99.0.0/16 ucd_net

docker run -d --rm --name ucd-server --ip 172.99.0.2 --network ucd_net -p 8443:8443 -p 7918:7918 -p 8080:8080 -t ucds

docker run -d --rm --name ucd-agent --network ucd_net -e "AGENT_NAME=myagent" -e "SERVER_IP=172.99.0.2" -t ucda
docker run -d --rm --name ucd-agent --network ucd_net -e "AGENT_NAME=myagent1" -e "SERVER_IP=172.99.0.2" -t ucda
docker run -d --rm --name ucd-agent --network ucd_net -e "AGENT_NAME=myagent2" -e "SERVER_IP=172.99.0.2" -t ucda
docker run -d --rm --name ucd-agent --network ucd_net -e "AGENT_NAME=myagent3" -e "SERVER_IP=172.99.0.2" -t ucda
```


```bash
docker exec -it ucd-server /bin/bash
```
