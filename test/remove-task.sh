curr_count=$(curl http://localhost:8080/list 2>/dev/null | egrep -o "_id=[0-9a-z]*\"" | sed "s/_id=//g" | sed "s/\"//g" | uniq | wc -l) 
echo $curr_count request found on list page

v_count=0
for id in $(curl http://localhost:8080/list 2>/dev/null| egrep -o "_id=[0-9a-z]*\"" | sed "s/_id=//g" | sed "s/\"//g" | uniq)
do 
	curl -X GET http://localhost:8080/remove?_id=$id
        v_count=`expr $v_count + 1`
done
echo ""
echo $v_count records deleted

new=$(curl http://localhost1:8080/list 2>/dev/null | egrep -o "_id=[0-9a-z]*\"" | sed "s/_id=//g" | sed "s/\"//g" | uniq | wc -l) 
echo $new request found on list page

expected_count=`expr $curr_count - $v_count`
if [ $expected_count -ne $new ]
then
        echo "Test failed"
	exit 1 
fi


