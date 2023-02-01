## OBJETOS: BIOCONDUCTOR - RNA-Seq

# Paquetes y algunos de sus objetos:
# SummarizeExperiment
#   rowRanges: Genomic Ranges, IRanges
#             Tablas: para cada gen se tiene informacion
#             sobre lecturas, estas se encuentran organizadas
#             en tablas.
#             subsetByOverlaps(se,roi): Funcion que permite obtener informacion

# GenomicRanges
#   gr <- GRanges(
#          seqnames = tipo de secuencia Ej.Plasmido
#          ranges =
#          strand =
#          )

# IRanges: Run lenght encoded.
#   Paquete que sirve para almacenar de manera eficiente informacion que se repite
#   Almacena en un formato parecido a dataframe

# Rtracklayer
#   Importar archivos con distintas extensiones.

## Ejercicio: Creacion de primeros objetos y funciones importantes.

## Lets build our first SummarizedExperiment object / Libreria

library("SummarizedExperiment")
## ?SummarizedExperiment

## De los ejemplos en la ayuda oficial

## Creamos los datos para nuestro objeto de tipo SummarizedExperiment
## para 200 genes a lo largo de 6 muestras
nrows <- 200
ncols <- 6

## Números al azar de cuentas
## set.seed ayuda a tener informacion reproducible.
set.seed(20210223)

# Generando una matriz con una distribucion uniforme.
counts <- matrix(runif(nrows * ncols, 1, 1e4), nrows)

## Información de nuestros genes

rowRanges <- GRanges(
  rep(c("chr1", "chr2"), c(50, 150)),
  IRanges(floor(runif(200, 1e5, 1e6)), width = 100),
  strand = sample(c("+", "-"), 200, TRUE),
  feature_id = sprintf("ID%03d", 1:200)
)
names(rowRanges) <- paste0("gene_", seq_len(length(rowRanges)))

## Información de nuestras muestras
colData <- DataFrame(
  Treatment = rep(c("ChIP", "Input"), 3),
  row.names = LETTERS[1:6]
)

## Juntamos ahora toda la información en un solo objeto de R
rse <- SummarizedExperiment(
  assays = SimpleList(counts = counts),
  rowRanges = rowRanges,
  colData = colData
)

## Exploremos el objeto resultante
rse

## Número de genes y muestras
dim(rse)

## IDs de nuestros genes y muestras- Nombres.
dimnames(rse)

## Nombres de tablas de cuentas que tenemos (RPKM, CPM, counts, logcounts, etc)
assayNames(rse)

## El inicio de nuestra tabla de cuentas
head(assay(rse))

## Información de los genes en un objeto de Bioconductor
rowRanges(rse)

## Comando 1
# Nos muestra los primeros dos genes (primeras dos columnas, las 6 columnas del objeto)
rse[1:2, ]

## Comando 2
# Acedemos a los 200 genes (renglones) y solo las columnas seleccionadas
rse[, c("A", "D", "F")]

## MAS LIBRERIAS IMPORTANTES:

# ISEE
#     Genera paginas wed
#     Contiene varias opciones que permite observar tus datos, en el caso del
#     ejemplo anterior con el objeto (rse) que contiene genes, podemos observar la
#     informacion de  un gen en especifico, permitiendo seleccionarlo de una manera
#     mas interactiva y visual.
#     Muestra heatmaps.
#     Permite descargar paneles de las imagenes generadas.
#     Ej. Explora el objeto rse de forma interactiva.
library("iSEE")
iSEE::iSEE(rse)

# SingleCellExperiment
#   Expande informacion de SummarizedExperiment, resume la informacion.

# Ejercicio: Descargar datos de un objeto SingleCellExperiment.
## Descarguemos unos datos de spatialLIBD
sce_layer <- spatialLIBD::fetch_data("sce_layer")

## Revisemos el tamaño de este objeto
lobstr::obj_size(sce_layer) / 1024^2 ## Convertir a MB

# Revisando objeto con ISEE y generando imagenes.
iSEE::iSEE(sce_layer)
