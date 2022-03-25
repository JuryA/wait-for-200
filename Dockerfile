FROM scratch
LABEL org.opencontainers.image.authors="jiri.altman@usu.com"
LABEL version=0.2

WORKDIR /

ADD --chmod=0755 https://github.com/robxu9/bash-static/releases/download/5.1.016-1.2.2/bash-linux-x86_64 bash
ADD --chmod=0755 https://github.com/moparisthebest/static-curl/releases/download/v7.82.0/curl-amd64 curl
COPY --chmod=0755 wait-for-200.sh .

ENV PATH="/"

ENTRYPOINT [ "bash","-c","wait-for-200.sh" ]
