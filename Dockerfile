FROM braughtg/vnc-novnc-base:1.1.0

# Run the root.bash script here to do all of the root configuration.
# E.g. apt install, etc...
USER root
WORKDIR /
COPY --chmod=755 ./root.bash .
RUN ./root.bash \
 && rm root.bash

# Run the student.bash script here to do any configration as the student.
# E.g. git clone, etc...
USER student
WORKDIR /home/student
COPY --chmod=755 ./student.bash .
RUN ./student.bash \
 && rm student.bash

# Place the launch.bash script into the container.
COPY --chmod=755 ./launch.bash .contconf/launch.bash