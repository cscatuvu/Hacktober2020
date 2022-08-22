#!/usr/bin/env bash

CONTAINER='jrrdev/cve-2017-5638'
CONTAINER_NAME='apache-confluence'

docker pull ${CONTAINER}
docker rm -f ${CONTAINER_NAME}
# Modify container entrypoint
docker run --name ${CONTAINER_NAME} ${CONTAINER} & sleep 20
docker exec ${CONTAINER_NAME} bash -c "cat << 'EOF' > /cve-2017-538/entry-point.sh
#!/bin/bash
java -jar /cve-2017-538/cve-2017-538-example.jar
EOF"
CONTAINER=$(docker commit ${CONTAINER_NAME} | awk -F: '{print $2}')
docker rm -f ${CONTAINER_NAME}
docker run --cpus .7 --cpu-shares 256 --memory 1024M --restart always --name ${CONTAINER_NAME} -p 3543:8080 ${CONTAINER} 'flag{22aa2c00a1reti6r3e9044204e65b1f72}' & sleep 10
docker exec ${CONTAINER_NAME} bash -c 'rm -rvf /root/.bash_history /usr/bin/apk* /usr/bin/lbu* /cve-2017-538/exploit*'
