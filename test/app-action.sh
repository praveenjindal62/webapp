curr_count=$(curl http://localhost:8080/list 2>/dev/null | egrep -o "_id=[0-9a-z]*\"" | sed "s/_id=//g" | sed "s/\"//g" | uniq | wc -l) 
echo $curr_count request found on list page
v_count=0
for task in $(cat sample_todo_task.txt | grep Task| grep -v grep)
do
	name=$(echo $task| cut -f 1 -d ',')
        desc=$(echo $task| cut -f 2 -d ',')
	date=$(echo $task| cut -f 3 -d ',')
	pr=$(echo $task| cut -f 4 -d ',')	
        curl -X POST -d "name=${name}&desc=${desc}&date=${date}&pr=${pr}" http://localhost:8080/action
        v_count=`expr $v_count + 1`
done 
echo ""
echo $v_count request sent
new=$(curl http://localhost:8080/list 2>/dev/null | egrep -o "_id=[0-9a-z]*\"" | sed "s/_id=//g" | sed "s/\"//g" | uniq | wc -l) 
echo $new request found on list page

expected_count=`expr $curr_count + $v_count`
if [ $expected_count -ne $new ]
then
        echo "Test failed"
	exit 1 
fi




