echo $(curl http://localhost:8080/list 2>/dev/null| egrep -o "_id=[0-9a-z]*\"" | sed "s/_id=//g" | sed "s/\"//g" | uniq | wc -l) request found on list page

v_count=0
for id in $(curl http://localhost:8080/list 2>/dev/null| egrep -o "_id=[0-9a-z]*\"" | sed "s/_id=//g" | sed "s/\"//g" | uniq)
do 
	curl -X GET http://localhost:8080/remove?_id=$id
        v_count=`expr $v_count + 1`
done

echo $v_count records deleted

echo $(curl http://localhost:8080/list 2>/dev/null| egrep -o "_id=[0-9a-z]*\"" | sed "s/_id=//g" | sed "s/\"//g" | uniq | wc -l) request found on list page


