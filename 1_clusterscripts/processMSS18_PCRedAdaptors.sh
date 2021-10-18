#!/usr/bin/env bash
#Run command on HTCF: sbatch /home/arwolf/scripts/16S_processing.sbatch
#Author: mstaller@wustl.edu

#SBATCH --mem=16000

gunzip *.gz

grep -o CTAGC.*.CTCGAG Cohen_MSS18_13_1238_SIC-I2-43_CATACAACTA_GCGGGTGT_S3_R1_001.fastq > MSS18_13N.txt
grep -o CTAGC.*.CTCGAG Cohen_MSS18_14_1238_SIC-I2-44_CATACAACTA_TCTTATGT_S4_R1_001.fastq > MSS18_14N.txt
grep -o CTAGC.*.CTCGAG Cohen_MSS18_15_1238_SIC-I2-45_CATACAACTA_ACGCTAGT_S5_R1_001.fastq > MSS18_15N.txt
grep -o CTAGC.*.CTCGAG Cohen_MSS18_16_1238_SIC-I2-46_CATACAACTA_TTGATAGT_S6_R1_001.fastq > MSS18_16N.txt
grep -o CTAGC.*.CTCGAG Cohen_MSS18_17_1239_SIC-I2-43_GCATCGGCAA_GCGGGTGT_S7_R1_001.fastq > MSS18_17N.txt
grep -o CTAGC.*.CTCGAG Cohen_MSS18_18_1239_SIC-I2-44_GCATCGGCAA_TCTTATGT_S8_R1_001.fastq > MSS18_18N.txt
grep -o CTAGC.*.CTCGAG Cohen_MSS18_19_1239_SIC-I2-45_GCATCGGCAA_ACGCTAGT_S9_R1_001.fastq > MSS18_19N.txt
grep -o CTAGC.*.CTCGAG Cohen_MSS18_20_1239_SIC-I2-46_GCATCGGCAA_TTGATAGT_S10_R1_001.fastq > MSS18_20N.txt
grep -o CTAGC.*.CTCGAG Cohen_MSS18_21_1239_SIC-I2-47_GCATCGGCAA_TTACGCGT_S11_R1_001.fastq > MSS18_21N.txt
grep -o CTAGC.*.CTCGAG Cohen_MSS18_22_1239_SIC-I2-48_GCATCGGCAA_AATTGTGT_S12_R1_001.fastq > MSS18_22N.txt
grep -o CTAGC.*.CTCGAG Cohen_MSS18_23_1239_SIC-I2-49_GCATCGGCAA_TGCACGGT_S13_R1_001.fastq > MSS18_23N.txt
grep -o CTAGC.*.CTCGAG Cohen_MSS18_24_1239_SIC-I2-50_GCATCGGCAA_CGCTTCGT_S14_R1_001.fastq > MSS18_24N.txt

wc -l *.txt > lineCounts.txt

for i in $(ls MSS*.txt); do
	sort "$i" | uniq -c > "$i"sorted.txt
	rm "$i"grepped # remove intermediate file
done

	#BINNAME= $(echo $i | cut -d '.' -f 1)
	