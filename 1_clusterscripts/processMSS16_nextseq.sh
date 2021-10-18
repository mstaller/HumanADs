#!/usr/bin/env bash
#Run command on HTCF: sbatch /home/arwolf/scripts/16S_processing.sbatch
#Author: mstaller@wustl.edu

#SBATCH --mem=16000


python /home/mstaller/scripts/fastqconvert_XbaI.py Cohen_MVS_MSS16_SIC71_TGGGTTCGA_S2_R1_001.fastq MSS16_01.txt MSS16_02.txt MSS16_03.txt MSS16_04.txt MSS16_05.txt MSS16_06.txt MSS16_07.txt MSS16_08.txt MSS16_09.txt MSS16_10.txt MSS16_11.txt MSS16_12.txt unmapped

wc -l * > lineCounts.txt

for i in $(ls MSS*.txt); do
	grep -o CTAGC.*.CTCGAG $i > "$i"grepped # NheI (last 5) and XhoI
	sort "$i"grepped | uniq -c > "$i"sorted.txt
	rm "$i"grepped # remove intermediate file
done

	#BINNAME= $(echo $i | cut -d '.' -f 1)
