#!/usr/bin/env bash
#Run command on HTCF: sbatch /home/arwolf/scripts/16S_processing.sbatch
#Author: mstaller@wustl.edu

#SBATCH --mem=16000

gunzip *.gz

python /home/mstaller/scripts/fastqconvert_XbaI.py Cohen_MVS_MSS17_SIC_69_AGCGTGCCCA_S2_R1_001.fastq MSS17_1_A.txt MSS17_2_A.txt MSS17_3_A.txt MSS17_4_A.txt MSS17_5_A.txt MSS17_6_A.txt MSS17_7_A.txt MSS17_8_A.txt empty_A.txt MSS17pre1000_A.txt MSS17pre500_A.txt MSS17pre250_A.txt unmapped_69
python /home/mstaller/scripts/fastqconvert_XbaI.py Cohen_MVS_MSS17_SIC_70_ATGTCCCTAA_S3_R1_001.fastq MSS17_1_B.txt MSS17_2_B.txt MSS17_3_B.txt MSS17_4_B.txt MSS17_5_B.txt MSS17_6_B.txt MSS17_7_B.txt MSS17_8_B.txt empty_B.txt MSS17pre1000_B.txt MSS17pre500_B.txt MSS17pre250_B.txt unmapped_70
python /home/mstaller/scripts/fastqconvert_XbaI.py Cohen_MVS_MSS17_SIC_73_TAGCTGTTAA_S4_R1_001.fastq MSS17_1_C.txt MSS17_2_C.txt MSS17_3_C.txt MSS17_4_C.txt MSS17_5_C.txt MSS17_6_C.txt MSS17_7_C.txt MSS17_8_C.txt empty_C.txt MSS17pre1000_C.txt MSS17pre500_C.txt MSS17pre250_C.txt unmapped_71
python /home/mstaller/scripts/fastqconvert_XbaI.py Cohen_MVS_MSS17_SIC_74_GCATTTGCCA_S5_R1_001.fastq MSS17_1_D.txt MSS17_2_D.txt MSS17_3_D.txt MSS17_4_D.txt MSS17_5_D.txt MSS17_6_D.txt MSS17_7_D.txt MSS17_8_D.txt empty_D.txt MSS17pre1000_D.txt MSS17pre500_D.txt MSS17pre250_D.txt unmapped_72
python /home/mstaller/scripts/fastqconvert_XbaI.py Cohen_MVS_MSS17_SIC_index_1238_CATACAACTA_S6_R1_001.fastq MSS17_1_E.txt MSS17_2_E.txt MSS17_3_E.txt MSS17_4_E.txt MSS17_5_E.txt MSS17_6_E.txt MSS17_7_E.txt MSS17_8_E.txt empty_E.txt MSS17pre1000_E.txt MSS17pre500_E.txt MSS17pre250_E.txt unmapped_1238
python /home/mstaller/scripts/fastqconvert_XbaI.py Cohen_MVS_MSS17_SIC_index_1239_GCATCGGCAA_S7_R1_001.fastq MSS17_1_F.txt MSS17_2_F.txt MSS17_3_F.txt MSS17_4_F.txt MSS17_5_F.txt MSS17_6_F.txt MSS17_7_F.txt MSS17_8_F.txt empty_F.txt MSS17pre1000_F.txt MSS17pre500_F.txt MSS17pre250_F.txt unmapped_1239
python /home/mstaller/scripts/fastqconvert_XbaI.py Cohen_MVS_MSS17_SIC_index_1240_TGCAGTCACA_S8_R1_001.fastq MSS17_1_G.txt MSS17_2_G.txt MSS17_3_G.txt MSS17_4_G.txt MSS17_5_G.txt MSS17_6_G.txt MSS17_7_G.txt MSS17_8_G.txt empty_G.txt MSS17pre1000_G.txt MSS17pre500_G.txt MSS17pre250_G.txt unmapped_1240
python /home/mstaller/scripts/fastqconvert_XbaI.py Cohen_MVS_MSS17_SIC_index_1241_GAGTTCATTA_S9_R1_001.fastq MSS17_1_H.txt MSS17_2_H.txt MSS17_3_H.txt MSS17_4_H.txt MSS17_5_H.txt MSS17_6_H.txt MSS17_7_H.txt MSS17_8_H.txt empty_H.txt MSS17pre1000_H.txt MSS17pre500_H.txt MSS17pre250_H.txt unmapped_1241

wc -l * > lineCounts.txt

for i in $(ls MSS*.txt); do
	grep -o CTAGC.*.CTCGAG $i > "$i"grepped # NheI (last 5) and XhoI
	sort "$i"grepped | uniq -c > "$i"sorted.txt
	rm "$i"grepped # remove intermediate file
done

	#BINNAME= $(echo $i | cut -d '.' -f 1)
	