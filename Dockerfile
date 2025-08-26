FROM ubuntu:latest

RUN apt-get update && apt-get install -y netcat-openbsd

COPY index.html /index.html

EXPOSE 8080

CMD while true; do \
      { \
        echo -e "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\nConnection: close\r\n\r\n"; \
        cat /index.html; \
      } | nc -l -p 8080 -q 1; \
    done
