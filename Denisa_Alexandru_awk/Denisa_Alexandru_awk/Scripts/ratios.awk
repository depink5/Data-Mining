#!/usr/bin/awk -f
#Script para calcular los ratios mutante_vs_control, y guardar los datos correspondientes de cada mutante y WT en un fichero.tst específico para cada uno
BEGIN{
#Se generan las cabeceras de cada archivo y se genera un archivo para cada mutante y WT
print "#old_locus_tag\tlocus_tag\tratio_vs_control\tdescription" > "Results/S207.txt"
print "#old_locus_tag\tlocus_tag\tratio_vs_control\tdescription" > "Results/WT.txt"
print "#old_locus_tag\tlocus_tag\tratio_vs_control\tdescription" > "Results/H12.txt"
print "#old_locus_tag\tlocus_tag\tratio_vs_control\tdescription" > "Results/D56.txt"
}
#Se utiliza NR>1 para evitar coger la cabecera del fichero en el que se tienen los datos
NR>1{
#El control, que va a estar en el denominador, se encuntra en la columna 7.
#Es posible que el RPKM del control sea cero, por lo que, en ese caso, se considera que el ratio equivale al RPKM medio del mutante o WT en cuestión
if ($7==0){
  ratio_vs_control1=$3
  ratio_vs_control2=$4
  ratio_vs_control3=$5
  ratio_vs_control4=$6
}
#Si la media de los RPKMs del control no es cero, se procede a calcular el ratio por división del mutante o WT entre los RPKMs del control
else{
  ratio_vs_control1=$3/$7
  ratio_vs_control2=$4/$7
  ratio_vs_control3=$5/$7
  ratio_vs_control4=$6/$7
}
#Se guardan los datos obtenidos de cada mutante y WT en sus ficheros .txt correspondientes
print $2"\t"$1"\t"ratio_vs_control1"\t"$8 >> "Results/S207.txt"
print $2"\t"$1"\t"ratio_vs_control2"\t"$8 >> "Results/WT.txt"
print $2"\t"$1"\t"ratio_vs_control3"\t"$8 >> "Results/H12.txt"
print $2"\t"$1"\t"ratio_vs_control4"\t"$8 >> "Results/D56.txt"
}


