FROM gitlab/gitlab-runner:alpine
RUN apk add jq vault libcap ansible && setcap -r /usr/sbin/vault
