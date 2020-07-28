FROM introlab3it/rtabmap_ros:melodic

ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

ARG CACHE_DATE=2016-01-01

ARG myuser
RUN adduser $myuser

RUN apt-get update

RUN apt-get install apt-utils -y

RUN apt-get install ros-melodic-perception-pcl ros-melodic-apriltag ros-melodic-apriltag-ros -y

RUN apt-get install ros-melodic-realsense* ros-melodic-imu-tools -y

RUN apt-get install python-catkin-tools -y

RUN apt-get install vim -y

RUN apt-get install ntp ntpdate -y

RUN source /ros_entrypoint.sh

RUN apt-get remove ros-melodic-rtabmap-ros
