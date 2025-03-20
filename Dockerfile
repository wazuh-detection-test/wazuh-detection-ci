FROM ubuntu:20.04

# Install dependencies and add Wazuh repository
RUN apt-get update && apt-get install -y curl gnupg
RUN curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add -
RUN echo "deb https://packages.wazuh.com/4.x/apt/ stable main" > /etc/apt/sources.list.d/wazuh.list
RUN apt-get update && apt-get install -y ssh wazuh-agent

# Copy rules and test scripts into the container
COPY ./rules /etc/ossec/rules/
COPY ./scripts/run_tests.sh /opt/tests/

# Define the container's default behavior
CMD ["/bin/bash"]

