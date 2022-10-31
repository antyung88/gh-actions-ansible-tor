FROM ubuntu

USER root

ENV ANSIBLE_HOST_KEY_CHECKING=False

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y unzip curl ansible python3 python3-pip sshpass socat

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]