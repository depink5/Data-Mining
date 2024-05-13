#!bin/bash
# Creamos la carpeta Results, donde sa van añadir los 4 ficheros pedidos.
mkdir Results
# Se ejecuta el Script 1, que sirve para procesar los tres ficheros de datos iniciales y obtener la información pedida de cada gen
bash Scripts/Script1
# Con el siguiente Script se va a calcular la longitud de la regiones pedidas y se van a guardar en un archivo que contiene los locus_tag y old_locus_tag de los genes además de la longitud calculada
awk -f Scripts/longitud_regiones Data/datos.tsv > Data/tag_length.tsv
# Con este Script se obtiene el archivo datos_finales.tsv que contiene los datos del archivo read_counts.tsv y las longitudes de las regiones, además del locus_tag de los genes
bash Scripts/Script2
# Con el Script3 se calculan los total reads de cada columna
awk -f Scripts/Script3 Data/datos_finales1.tsv > Data/pr.tsv
# Se procede a añadir los total reads de cada columna repetidos para cada gen al fichero datos_finales1.tsv y se almacena en datos_finales2.tsv
paste Data/datos_finales1.tsv Data/pr.tsv > Data/datos_finales2.tsv
# Con el Script4 se calculan los RPKMs de cada mutante y Control y se hacen las medias de los RPKM
awk -f Scripts/Script4.awk Data/datos_finales2.tsv
#Con el Script5 se procede añadir las decripciones de los genes a los otros datos (locus_tag, old_locus_tag, RPKMs)
bash Scripts/Script5
# Por último, con este Script se calculan los ratios para cada gen de cada mutante y WT y se generan los archivos.txt pedidos.
awk -f Scripts/ratios.awk Data/RPKM1_media.tsv
