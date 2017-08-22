# docker-dvwa
Docker image for DVWA([Damn Vulnerable Web Application](http://www.dvwa.co.uk/))

### Using

- Pull image `docker build -t xiaolu/dvwa .`
- Start with random mysql password: `docker run -d -p 81:80 xiaolu/dvwa`
- Or set environment variable: `docker run -d -p 81:80 -p 3307:3306 -e MYSQL_PASS="Chang3ME!" xiaolu/dvwa`
