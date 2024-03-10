FROM gitlab/gitlab-runner:alpine
RUN apk add jq vault libcap && setcap -r /usr/sbin/vault
