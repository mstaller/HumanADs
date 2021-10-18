#!/usr/bin/env bash
#Run command on HTCF: sbatch /home/mstaller/scripts/grepANDsort_NheI_XhoI.sbatch
#Author: awolf@wustl.edu
#modified by: mstaller@wustl.edu 20181107

#SBATCH --mem=16000

for i in $(ls L*.txt); do
	grep -o CTAGC.*.CTCGAG $i > "$i"grepped # NheI (last 5) and XhoI
	sort "$i"grepped | uniq -c > "$i"sorted.txt
	rm "$i"grepped # remove intermediate file
done

	#BINNAME= $(echo $i | cut -d '.' -f 1)
	