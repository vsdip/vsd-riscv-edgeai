# Base image
FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

ENV DEBIAN_FRONTEND=noninteractive

# --- System + GUI/VNC + build deps ---
RUN apt-get update && apt-get install -y --no-install-recommends \
    git build-essential autoconf automake libtool m4 \
    tcl tcl-dev tk tk-dev libcairo2-dev libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev \
    libx11-dev libxext-dev libxrender-dev libxpm-dev libxaw7-dev libfontconfig1-dev \
    libreadline-dev libncurses-dev flex bison gawk tcsh \
    python3 python3-pip python3-venv pkg-config curl ca-certificates wget \
    xfce4 xfce4-terminal x11vnc xvfb novnc websockify supervisor dbus-x11 gedit vim \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# --- Configure noVNC desktop ---
COPY supervisord.conf /etc/supervisor/conf.d/vnc.conf

# Create Desktop directory
RUN mkdir -p /home/vscode/Desktop && chown -R vscode:vscode /home/vscode/Desktop

EXPOSE 6080

# Launch GUI through supervisord
CMD ["/usr/bin/supervisord", "-n"]
