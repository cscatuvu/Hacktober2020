#!/usr/bin/env bash

CONTAINER='vulnerables/cve-2014-6271'
CONTAINER_NAME='shellshock'

docker pull ${CONTAINER}
docker rm -f ${CONTAINER_NAME}
docker run --cpus .7 --cpu-shares 256 --memory 256M --name ${CONTAINER_NAME} -p 4736:80 ${CONTAINER} & sleep 10
docker exec ${CONTAINER_NAME} bash -c 'echo "flag{d99bf4907e12df3c2df0214070}" > /.flag.txt'
docker exec ${CONTAINER_NAME} bash -c 'cat << EOF > /var/www/index.html
<html>
    <head><title>In progress...</title></head>
    <body>
        <h1>In progress...</h1>
        <pre>The script is at /cgi-bin/script</pre>
    </body>
</html>
EOF'
docker exec ${CONTAINER_NAME} bash -c 'chmod 444 /var/www/index.html'
docker exec ${CONTAINER_NAME} bash -c 'mv /usr/lib/cgi-bin/{vulnerable,script}'
docker exec ${CONTAINER_NAME} bash -c 'cat << EOF > /usr/lib/cgi-bin/script
#!/bin/bash

echo "Content-type: text/html";
echo ""

echo "<pre>"
echo "# uptime"
uptime
echo
echo "# ls -alh"
ls -alh
echo "</pre>"
EOF'
