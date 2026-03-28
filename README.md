# Laboratorium 5

## Treść pliku Dockerfile

FROM alpine AS builder

ARG VERSION=1.0.0

ENV VERSION=${VERSION}

RUN mkdir /output

COPY generate_index.sh /generate_index.sh
RUN chmod +x /generate_index.sh

RUN /generate_index.sh


FROM nginx:alpine

COPY --from=builder /output/index.html /usr/share/nginx/html/index.html

EXPOSE 80

HEALTHCHECK --interval=10s --timeout=2s \
  CMD wget -qO- http://localhost:80/ || exit 1

## Polecenie budowy obrazu
docker build -t webinfo:v1.0 --build-arg VERSION=1.0.0 .

## Polecenie uruchamiające serwer
docker run -d -p 8080:80 --name lab5test webinfo:v1.0

## Polecenie potwierdzające działanie kontenera
docker ps --filter name=lab5test

