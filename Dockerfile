FROM tutum/lamp

MAINTAINER Daniel Romero <infoslack@gmail.com>

ENV VERSION master

RUN rm -rf /app && \
    rm /etc/apt/sources.list && echo CmRlYiBodHRwOi8vbWlycm9ycy4xNjMuY29tL3VidW50dS8gdHJ1c3R5IG1haW4gcmVzdHJpY3RlZCB1bml2ZXJzZSBtdWx0aXZlcnNlCgpkZWIgaHR0cDovL21pcnJvcnMuMTYzLmNvbS91YnVudHUvIHRydXN0eS1zZWN1cml0eSBtYWluIHJlc3RyaWN0ZWQgdW5pdmVyc2UgbXVsdGl2ZXJzZQoKZGViIGh0dHA6Ly9taXJyb3JzLjE2My5jb20vdWJ1bnR1LyB0cnVzdHktdXBkYXRlcyBtYWluIHJlc3RyaWN0ZWQgdW5pdmVyc2UgbXVsdGl2ZXJzZQoKZGViIGh0dHA6Ly9taXJyb3JzLjE2My5jb20vdWJ1bnR1LyB0cnVzdHktcHJvcG9zZWQgbWFpbiByZXN0cmljdGVkIHVuaXZlcnNlIG11bHRpdmVyc2UKCmRlYiBodHRwOi8vbWlycm9ycy4xNjMuY29tL3VidW50dS8gdHJ1c3R5LWJhY2twb3J0cyBtYWluIHJlc3RyaWN0ZWQgdW5pdmVyc2UgbXVsdGl2ZXJzZQoKZGViLXNyYyBodHRwOi8vbWlycm9ycy4xNjMuY29tL3VidW50dS8gdHJ1c3R5IG1haW4gcmVzdHJpY3RlZCB1bml2ZXJzZSBtdWx0aXZlcnNlCgpkZWItc3JjIGh0dHA6Ly9taXJyb3JzLjE2My5jb20vdWJ1bnR1LyB0cnVzdHktc2VjdXJpdHkgbWFpbiByZXN0cmljdGVkIHVuaXZlcnNlIG11bHRpdmVyc2UKCmRlYi1zcmMgaHR0cDovL21pcnJvcnMuMTYzLmNvbS91YnVudHUvIHRydXN0eS11cGRhdGVzIG1haW4gcmVzdHJpY3RlZCB1bml2ZXJzZSBtdWx0aXZlcnNlCgpkZWItc3JjIGh0dHA6Ly9taXJyb3JzLjE2My5jb20vdWJ1bnR1LyB0cnVzdHktcHJvcG9zZWQgbWFpbiByZXN0cmljdGVkIHVuaXZlcnNlIG11bHRpdmVyc2UKCmRlYi1zcmMgaHR0cDovL21pcnJvcnMuMTYzLmNvbS91YnVudHUvIHRydXN0eS1iYWNrcG9ydHMgbWFpbiByZXN0cmljdGVkIHVuaXZlcnNlIG11bHRpdmVyc2U= | base64 -d > /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y wget php5-gd unzip && \
    rm -rf /var/lib/apt/lists/*

COPY conf/* /tmp/

RUN wget https://github.com/ethicalhack3r/DVWA/archive/${VERSION}.zip && \
    unzip /${VERSION}.zip && \
    mv -f /DVWA-${VERSION} /app && \
    rm /app/.htaccess && \
    mv /tmp/.htaccess /app && \
    chmod +x /tmp/setup_dvwa.sh && \
    /tmp/setup_dvwa.sh

EXPOSE 80 3306

CMD ["/run.sh"]
