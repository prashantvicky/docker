FROM alpine:3.3

ENTRYPOINT ["cd /root ; /bin/kubectl create -f 'kafka_pv.yml,zookeeper_pv.yml,etcd_pv.yml,redisprimary_pv.yml'"]

ENV KUBE_LATEST_VERSION="v1.5.4"
 WORKDIR /pv
 ADD . /root
 
 RUN apk add --update ca-certificates \
 && apk add --update -t deps curl \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /bin/kubectl \
 && chmod +x /bin/kubectl \
 && apk del --purge deps \
 && ADD *.yml /root
 && rm /var/cache/apk/*
