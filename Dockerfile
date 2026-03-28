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