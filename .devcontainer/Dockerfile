FROM ros:galactic-ros-base

# ROS parameter
ENV ROS_DISTRO=galactic
ENV PATH=/opt/ros/${ROS_DISTRO}/bin:$PATH
ENV PYTHONPATH=/opt/ros/${ROS_DISTRO}/lib/python3.8/site-packages
ENV DEBIAN_FRONTEND=noninteractive

# User credentials for non-root user
ARG USERNAME=user
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# set timezone
ENV TZ=Europe/Zurich

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y ssh \
  sudo \
  build-essential \
  curl \
  git \
  gcc \
  g++ \
  gdb \
  clang \
  cmake \
  rsync \
  tar \
  python \
  python3-pip \
  uncrustify \
  ros-$ROS_DISTRO-desktop \ 
  pylint3 \
  python3-argcomplete \
  python3-colcon-common-extensions \
  python3-pip \
  python3-rosdep \
  python3-vcstool \
  ros-${ROS_DISTRO}-ament-lint \
  ros-${ROS_DISTRO}-launch-testing \
  ros-${ROS_DISTRO}-launch-testing-ament-cmake \
  ros-${ROS_DISTRO}-launch-testing-ros \
  python3-autopep8 \ 
  ros-${ROS_DISTRO}-gazebo*


# Create the user and source the ros distro
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME \
  && echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> /home/$USERNAME/.bashrc

USER user
# install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

ENV PATH="/home/${USERNAME}/.cargo/bin:${PATH}"