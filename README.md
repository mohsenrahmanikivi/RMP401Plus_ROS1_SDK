## Docker file
to build docker image for jetson arm 64 v8 , enter to the folder of docker file and run
- <code>docker build -t ros1-melodic-arm64 .</code>

## run the Image
if your working space is not the same as "/ssd/workspaces/catkin_ws" change it as it is goinf to be shared folde with container
- <code>docker run -it --rm\
  --device=/dev/ttyUSB0:/dev/ttyUSB0 \
  -v "/ssd/workspaces/catkin_ws:/root/catkin_ws
  --privileged \
  --name ros1_container \
  ros1-melodic-arm64</code>


## attache to active seasion
Find container id then attache to it
- <code>docker ps </code>
- <code>docker exec -it <container_id_or_name> /bin/bash </code>
