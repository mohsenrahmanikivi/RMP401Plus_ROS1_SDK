# ROS 1 Melodic desktop-full on Ubuntu 18.04 for ARM64
FROM arm64v8/ros:melodic

# Set environment for non-interactive apt installs
ENV DEBIAN_FRONTEND=noninteractive

# Install essential build tools and ROS tf package
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ros-melodic-tf \
    && rm -rf /var/lib/apt/lists/*

# Create and initialize catkin workspace
RUN mkdir -p /root/catkin_ws/src
WORKDIR /root/catkin_ws

# Run catkin_make with proper environment
RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && catkin_make"

# Auto-source environment on shell start
RUN echo "source /opt/ros/melodic/setup.bash" >> /root/.bashrc && \
    echo "source /root/catkin_ws/devel/setup.bash" >> /root/.bashrc

# Set default working directory
WORKDIR /root/catkin_ws
