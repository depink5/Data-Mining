#!/usr/bin/awk -f
#Este Script sirve para calcular los RPKMs de cada mutante, WT Control y las correspondientes réplicas
#Además, se usa para calcular las medias entre las réplicas
BEGIN{
#Se generan la cabecera del archivo, que indica la información de cada columna
# Primero se genera un archivo que contiene todos los RPKM
print "locus_tag\told_locus_tag\tS207_1\tWT_1\tControl_1\tH12_1\tD56_1\tS207_2\tWT_2\tControl_2\tH12_2\tD56_2" > "Data/RPKM.tsv"
#Segundo, se genera un archivo que contiene las medias entre las réplicas
print "locus_tag\told_locus_tag\tS207\tWT\tH12\tD56\tControl" > "Data/RPKM_media.tsv"
}
#Se usa NR>1 para evitar que se use la cabecera del archivo de donde proceden los datos
NR>1{
#Se calculan los RPKM usando la fórmula dada
RPKM1=$2/(($14/1000000)*($13/1000))
RPKM2=$3/(($15/1000000)*($13/1000))
RPKM3=$4/(($16/1000000)*($13/1000))
RPKM4=$5/(($17/1000000)*($13/1000))
RPKM5=$6/(($18/1000000)*($13/1000))
RPKM6=$7/(($19/1000000)*($13/1000))
RPKM7=$8/(($20/1000000)*($13/1000))
RPKM8=$9/(($21/1000000)*($13/1000))
RPKM9=$10/(($22/1000000)*($13/1000))
RPKM10=$11/(($23/1000000)*($13/1000))
#Se calculan las medias entre las réplicas
RPKM_S207=(RPKM1+RPKM6)/2
RPKM_WT=(RPKM2+RPKM7)/2
RPKM_Control=(RPKM3+RPKM8)/2
RPKM_H12=(RPKM4+RPKM9)/2
RPKM_D56=(RPKM5+RPKM10)/2
#Se almacena cada dato en su fichero correspondiente
print $12"\t"$1"\t"RPKM1"\t"RPKM2"\t"RPKM3"\t"RPKM4"\t"RPKM5"\t"RPKM6"\t"RPKM7"\t"RPKM8"\t"RPKM9"\t"RPKM10 >> "Data/RPKM.tsv"
print $12"\t"$1"\t"RPKM_S207"\t"RPKM_WT"\t"RPKM_H12"\t"RPKM_D56"\t"RPKM_Control >> "Data/RPKM_media.tsv"
}

