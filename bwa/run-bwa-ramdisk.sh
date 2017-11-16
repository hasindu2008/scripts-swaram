logfile=Nov15.txt
bwalog=logNov15.txt
reads_per_device=196816277

echo "test result" > $logfile

for i in $(seq 1)
do
	
	echo "repeat number $i"
	echo "repeat number $i" >> $logfile
	ansible all -m shell -a "/home/odroid/Ram_Research_V04/exec.o 80000 $reads_per_device" -f 16 > $bwalog
    grep -E "(192\.168\.1.*SUCCESS|Real )" $bwalog | grep -Eo "(192\.168\.1\.[0-9]{3}|Real time:\s+[0-9]{2,4}\.[0-9]{2,4})" >> $logfile
    echo -e '\n' >> $logfile

done
