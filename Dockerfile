FROM ubuntu:latest
LABEL author="James Bradlee <james.bradlee@telenor.no>"

RUN apt-get update \
	&& apt-get install -y bash git wget zip unzip curl git \
	&& apt-get clean \
	&& rm -rf /var/lib/lists/*

RUN bash -c "curl -s 'https://get.sdkman.io' | bash \
	&& source $HOME/.sdkman/bin/sdkman-init.sh \
	&& yes | sdk install java 17.0.2-tem \
	&& rm -rf $HOME/.sdkman/archives/* \
	&& rm -rf $HOME/.sdkman/tmp/*"

RUN wget --no-verbose -O /tmp/idea.tar.gz https://download-cdn.jetbrains.com/idea/ideaIC-2023.1.3.tar.gz \
	&& cd /opt \
	&& tar xzf /tmp/idea.tar.gz \
	&& mv /opt/idea* /opt/idea \
	&& rm -rf /tmp/idea.tar.gz

COPY entrypoint.sh /bin/docker-entrypoint.sh
RUN chmod +x /bin/docker-entrypoint.sh

ENTRYPOINT [ "/bin/docker-entrypoint.sh" ]
