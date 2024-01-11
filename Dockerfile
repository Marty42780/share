FROM alpine:3.14

# Install dependencies
RUN apk update 
RUN apk add --no-cache \
    rsync \
    openssh-server

# Create user
RUN adduser -D -s /bin/bash -h /home/share share
RUN echo "share:${password}" | chpasswd

# SSH
RUN ssh-keygen -A
EXPOSE 22

ENTRYPOINT [ "/usr/sbin/sshd", "-D" ]