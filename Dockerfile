FROM golang:1.11-alpine

ENV Gotest=/go/src/gotest

COPY . $Gotest/

RUN cd $Gotest \
&& go build -o app

FROM alpine

ENV  Gotest=/go/src/gotest
COPY --from=0  $Gotest/app /usr/bin
WORKDIR /data

CMD ["app"]