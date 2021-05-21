FROM debian:sid-slim

ENV KUBEVAL_VERSION 0.16.1
ENV CONFTEST_VERSION 0.25.0
ENV PLUTO_VERSION 4.1.2

WORKDIR /

RUN apt-get update \
  && apt-get install -y --no-install-recommends wget git ca-certificates openssl jq curl \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/*

# install kubeval
RUN wget https://github.com/instrumenta/kubeval/releases/download/v${KUBEVAL_VERSION}/kubeval-linux-amd64.tar.gz \
  && tar zxf kubeval-linux-amd64.tar.gz kubeval \
  && mv kubeval /usr/local/bin/. \
  && chmod +x /usr/local/bin/kubeval \
  && rm kubeval-linux-amd64.tar.gz

# install conftest
RUN wget https://github.com/open-policy-agent/conftest/releases/download/v${CONFTEST_VERSION}/conftest_${CONFTEST_VERSION}_Linux_x86_64.tar.gz \
  && tar zxf conftest_${CONFTEST_VERSION}_Linux_x86_64.tar.gz conftest \
  && mv conftest /usr/local/bin/. \
  && chmod +x /usr/local/bin/conftest \
  && rm conftest_${CONFTEST_VERSION}_Linux_x86_64.tar.gz \
  && /usr/local/bin/conftest pull -p policy github.com/instrumenta/policies.git//kubernetes

# install pluto
RUN wget https://github.com/FairwindsOps/pluto/releases/download/v${PLUTO_VERSION}/pluto_${PLUTO_VERSION}_linux_amd64.tar.gz \
  && tar zxf pluto_${PLUTO_VERSION}_linux_amd64.tar.gz pluto \
  && mv pluto /usr/local/bin/. \
  && chmod +x /usr/local/bin/pluto \
  && rm pluto_${PLUTO_VERSION}_linux_amd64.tar.gz

WORKDIR /work
