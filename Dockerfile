# Use alpine base image
FROM alpine

# Copy the current directory contents into the container at /
COPY start.sh /start.sh

# Install any needed packages

RUN apk update \
  && apk add --no-cache python3 py-netifaces git \
  && git clone --depth 1 https://github.com/alsmith/multicast-relay.git \
  && apk del git 
# use b fixBroadcast option before URL to download specific sub branch


# Define environment variable
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LANG C.UTF-8
ENV TZ America/New_York
ENV INTERFACES br10 br15 br20


# Run  when the container launches
# ENTRYPOINT ["./start.sh"]
# ENTRYPOINT ["./bin/ash"]
CMD ["sh", "./start.sh"]