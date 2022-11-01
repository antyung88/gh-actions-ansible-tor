FROM ubuntu

USER root

ENV ANSIBLE_HOST_KEY_CHECKING=False

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y software-properties-common && apt-add-repository ppa:ansible/ansible && apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y ansible sshpass socat 

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]