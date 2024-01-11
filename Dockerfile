FROM alpine:3.14

# Install dependencies
RUN apk update 
RUN apk add --no-cache \
    rsync \
    openssh-server

# Create user
RUN adduser -D -h /home/share share

# SSH
RUN ssh-keygen -A
EXPOSE 22

ENTRYPOINT echo "share:$PASSWORD" | chpasswd && /usr/sbin/sshd -D
