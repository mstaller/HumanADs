#!/usr/bin/env bash
#Run command on HTCF: sbatch /home/arwolf/scripts/16S_processing.sbatch
#Author: mstaller@wustl.edu

#SBATCH --mem=16000
#SBATCH -n 8
gunzip *.gz

srun -n 1 python /home/mstaller/scripts/fastqconvert_XbaI.py Cohen_MVS_MSS11_Poolc_SIC69_AGCGTGCCCA_S2_R1_001.fastq  MSS11_13_C.txt MSS11_13_K.txt MSS11_13_S.txt MSS11_14_C.txt MSS11_14_K.txt MSS11_14_S.txt MSS11_15_C.txt MSS11_15_K.txt MSS11_15_S.txt MSS11_16_C.txt MSS11_16_K.txt MSS11_16_S.txt unmapped_69
srun -n 1 python /home/mstaller/scripts/fastqconvert_XbaI.py Cohen_MVS_MSS11_Poolc_SIC70_ATGTCCCTAA_S3_R1_001.fastq  MSS11_13_D.txt MSS11_13_L.txt MSS11_13_T.txt MSS11_14_D.txt MSS11_14_L.txt MSS11_14_T.txt MSS11_15_D.txt MSS11_15_L.txt MSS11_15_T.txt MSS11_16_D.txt MSS11_16_L.txt MSS11_16_T.txt unmapped_70
srun -n 1 python /home/mstaller/scripts/fastqconvert_XbaI.py Cohen_MVS_MSS11_Poolc_SIC73_TAGCTGTTAA_S4_R1_001.fastq  MSS11_13_E.txt MSS11_13_M.txt MSS11_13_U.txt MSS11_14_E.txt MSS11_14_M.txt MSS11_14_U.txt MSS11_15_E.txt MSS11_15_M.txt MSS11_15_U.txt MSS11_16_E.txt MSS11_16_M.txt MSS11_16_U.txt unmapped_73
srun -n 1 python /home/mstaller/scripts/fastqconvert_XbaI.py Cohen_MVS_MSS11_Poolc_SIC74_GCATTTGCCA_S5_R1_001.fastq  MSS11_13_F.txt MSS11_13_N.txt MSS11_13_V.txt MSS11_14_F.txt MSS11_14_N.txt MSS11_14_V.txt MSS11_15_F.txt MSS11_15_N.txt MSS11_15_V.txt MSS11_16_F.txt MSS11_16_N.txt MSS11_16_V.txt unmapped_74
srun -n 1 python /home/mstaller/scripts/fastqconvert_XbaI.py Cohen_MVS_MSS11_Poolc_SIC_index_1238_CATACAACTA_S6_R1_001.fastq  MSS11_13_G.txt MSS11_13_O.txt MSS11_13_W.txt MSS11_14_G.txt MSS11_14_O.txt MSS11_14_W.txt MSS11_15_G.txt MSS11_15_O.txt MSS11_15_W.txt MSS11_16_G.txt MSS11_16_O.txt MSS11_16_W.txt unmapped_1238
srun -n 1 python /home/mstaller/scripts/fastqconvert_XbaI.py Cohen_MVS_MSS11_Poolc_SIC_index_1239_GCATCGGCAA_S7_R1_001.fastq  MSS11_13_H.txt MSS11_13_P.txt MSS11_13_X.txt MSS11_14_H.txt MSS11_14_P.txt MSS11_14_X.txt MSS11_15_H.txt MSS11_15_P.txt MSS11_15_X.txt MSS11_16_H.txt MSS11_16_P.txt MSS11_16_X.txt unmapped_1239
srun -n 1 python /home/mstaller/scripts/fastqconvert_XbaI.py Cohen_MVS_MSS11_Poolc_SIC_index_1240_TGCAGTCACA_S8_R1_001.fastq MSS11_13_I.txt MSS11_13_Q.txt MSS11_13_Y.txt MSS11_14_I.txt MSS11_14_Q.txt MSS11_14_Y.txt MSS11_15_I.txt MSS11_15_Q.txt MSS11_15_Y.txt MSS11_16_I.txt MSS11_16_Q.txt MSS11_16_Y.txt unmapped_1240
srun -n 1 python /home/mstaller/scripts/fastqconvert_XbaI.py Cohen_MVS_MSS11_Poolc_SIC_index_1241_GAGTTCATTA_S9_R1_001.fastq MSS11_13_J.txt MSS11_13_R.txt MSS11_13_Z.txt MSS11_14_J.txt MSS11_14_R.txt T7.1_E3_Z.txt MSS11_15_J.txt MSS11_15_R.txt LC1_s2_Z.txt MSS11_16_J.txt MSS11_16_R.txt water_Z.txt unmapped_1241

wait
wc -l * > lineCounts.txt

for i in $(ls MSS*.txt); do
	grep -o CTAGC.*.CTCGAG $i > "$i"grepped # NheI (last 5) and XhoI
	sort "$i"grepped | uniq -c > "$i"sorted.txt
	rm "$i"grepped # remove intermediate file
done

	#BINNAME= $(echo $i | cut -d '.' -f 1)
	