#!/bin/bash
#pulling elasticsearch image
sudo docker pull docker.elastic.co/elasticsearch/elasticsearch:7.9.1
# Vignes.txt file contains containerid that can be used for health check
sudo docker run -itd -p 9200:9200 -p 9300:9300 --name elasticsearch -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.9.1 /bin/bash > Vignes.txt
echo "Successfully created container: `tail -1 Vignes.txt`"

#Health check of the created container

cat Vignes.txt | while read CONTAINERID
do
echo "ContainerID : $CONTAINERID"
echo "running Status:"
sudo docker inspect --format="{{.State.Running}}" $CONTAINERID 2> /dev/null
echo "Started at:"
sudo docker inspect --format="{{.State.StartedAt}}" $CONTAINERID
echo "PID:"
sudo docker inspect --format="{{.State.Pid}}" $CONTAINERID
echo "Paused Status:"
sudo docker inspect --format="{{.State.Paused}}" $CONTAINERID
echo "restarting Status:"
sudo docker inspect --format="{{.State.Restarting}}" $CONTAINERID
echo "Network IP:"
sudo docker inspect --format="{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" $CONTAINERID
done