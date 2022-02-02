#!/bin/bash -e

source /opt/ros/$ROS_DISTRO/setup.bash

while sleep 1000; do :; done

exec $@