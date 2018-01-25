docker stop mongo_instance 
docker rm mongo_instance 
docker rmi mongo_image 
docker build -t mongo_image .
docker run -d --name mongo_instance -h mongo_instance -p 27017:27017 -t mongo_image
# docker exec -i -t mongo_instance /bin/bash

