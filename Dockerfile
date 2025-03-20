FROM ubuntu:20.04
RUN apt-get update && apt-get install -y ssh wazuh-agent
COPY ./rules /etc/ossec/rules/
COPY ./scripts/run_tests.sh /opt/tests/
CMD ["/bin/bash"]
