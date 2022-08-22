#!/usr/bin/env bash

CONTAINER='seuliu/cve-2012-2122'
CONTAINER_NAME='quivering-mysql'

docker pull ${CONTAINER}
docker rm -f ${CONTAINER_NAME}
docker run --cpus .7 --cpu-shares 256 --memory 256M --name ${CONTAINER_NAME} -p 4048:3306 ${CONTAINER} & sleep 10
# Make sure flag is in the container
docker exec ${CONTAINER_NAME} bash -c "mysql -u root -p123456 -e \"USE test_flag; DELETE FROM flag_tab; INSERT INTO flag_tab(flag) VALUES('synt{ps556u7ihdrn7nasdf39n67er8pnrdop}');\""
docker exec ${CONTAINER_NAME} bash -c 'rm /usr/local/bin/flagSet.sh /usr/bin/apt* /usr/bin/dpkg*'
docker exec ${CONTAINER_NAME} bash -c 'pkill -9 redis'
