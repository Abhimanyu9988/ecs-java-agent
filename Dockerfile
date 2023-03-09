# Sample Dockerfile for the AppDynamics Java AppServer Agent SideCar Container.
# This is provided for illustration purposes only, for full details 
# please consult the product documentation: https://docs.appdynamics.com/

FROM alpine

# Define environment variable for APPD_HOME
ENV APPD_HOME /opt/appdynamics

# Copy the Agent artifacts to APPD_HOME
RUN mkdir -p ${APPD_HOME}
COPY AppServerAgent-*.zip /tmp
RUN unzip -oq /tmp/AppServerAgent-*.zip -d ${APPD_HOME}

# Define the APPD_HOME
VOLUME ["/opt/appdynamics"]

# Keep the container running by starting a command that never ends
CMD ["tail", "-f", "/dev/null"]