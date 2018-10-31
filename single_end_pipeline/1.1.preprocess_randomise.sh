if [ "$#" -ne 3 ]
then
	echo "usage : $0 <file1.fq.gz> <file2.fq.gz> <output.fq>"
	exit
fi 

set -e
set -o pipefail

FILETMP=singleline.fq
OUTPUT=$3

zcat $1 | paste - - - - > $FILETMP 
zcat $2 | paste - - - - >> $FILETMP 

awk '{ 
number=int(4 * rand());
if(number=="0" ) {print $0> "temp0"} 
else if (number=="1") {print $0> "temp1"}
else if (number=="2") {print $0> "temp2"}
else if (number=="3") {print $0> "temp3"}
else {print $0> "error"}
}' $FILETMP || exit 

rm $FILETMP
cat temp0 temp1 temp2 temp3 | tr '\t' '\n' | awk 'BEGIN{i=1}{if(NR%4==1){printf("@sr%010u\n",i);i++}else{print;}}' > $OUTPUT 
rm temp0 temp1 temp2 temp3
