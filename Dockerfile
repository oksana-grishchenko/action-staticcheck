FROM golang:1.15

ENV REVIEWDOG_VERSION=v0.11.0

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

RUN apt-get install -y --no-install-recommends jq

RUN go get honnef.co/go/tools/cmd/staticcheck

COPY entrypoint.sh /entrypoint.sh
COPY to-rdjsonl.jq /to-rdjsonl.jq

ENTRYPOINT ["/entrypoint.sh"]
