# 1.stop and remove containers
source .env.db
source .env.network
source .env.volume

if [ -n "$(docker ps -q -f name=^/${DB_CONTAINER_NAME}$)" ]; then
    echo "Removing DB container $DB_CONTAINER_NAME"
    docker kill $DB_CONTAINER_NAME
else 
    echo "A container with the name $DB_CONTAINER_NAME does not exist. Skipping Container deletion"
fi

if [ "$(docker volume ls -q -f name=$VOLUME_NAME)" ]; then
    docker volume rm $VOLUME_NAME
    echo "volume $VOLUME_NAME removed"
else 
    echo "A volume with the name $VOLUME_NAME does not exist,Skipping the deletion"
fi

if [ "$(docker network ls -q -f name=$NETWORK_NAME)" ]; then
    docker network rm $NETWORK_NAME
    echo "network $NETWORK_NAME deleted"
else 
    echo "A network with the name $NETWORK_NAME does not exist,Skipping the deletion"
fi