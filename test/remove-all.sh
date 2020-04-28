for i in $(curl -X GET http://localhost:8080/list | grep -oe '_id=[0-9a-z]*'|uniq| sed 's/_id=//g'); do curl http://localhost:8080/remove?_id=${i};done;
