# EJERCICIO CON RECOUNT Y iSEE
## Ejercicio realizado en clase.

# Cargamos la libreria que se utilizara:
library("recount3")

## Cambiaremos el URL de recount3 a Amazon (AWS)
## Primero vemos el URL actual
getOption(
  "recount3_url",
  "http://duffel.rail.bio/recount3"
)

## Ahora si lo cambiamos, esto se hizo paraa evitar problemas con algunas versiones de windows
options(recount3_url = "https://recount-opendata.s3.amazonaws.com/recount3/release")

## Y vemos que ya funcionó el cambio.
getOption(
  "recount3_url",
  "http://duffel.rail.bio/recount3"
)

# Utilizamos recount para ver los proyectos: Agregando la URL
human_projects <- available_projects(recount3_url = "https://recount-opendata.s3.amazonaws.com/recount3/release")

# Descargando archivos:
# adding rname 'https://recount-opendata.s3.amazonaws.com/recount3/release/human/data_sources/sra/metadata/sra.recount_project.MD.gz'
# adding rname 'https://recount-opendata.s3.amazonaws.com/recount3/release/human/data_sources/tcga/metadata/tcga.recount_project.MD.gz'

## Encuentra tu proyecto de interés. Aquí usaremos
## SRP009615 de ejemplo
proj_info <- subset(
  human_projects,
  project == "SRP009615" & project_type == "data_sources"
)

## Crea un objetio de tipo RangedSummarizedExperiment (RSE)
## con la información a nivel de genes
rse_gene_SRP009615 <- create_rse(proj_info)

# Explorar objeto
rse_gene_SRP009615

## Explora los proyectos disponibles de forma interactiva
proj_info_interactive <- interactiveDisplayBase::display(human_projects)
## Selecciona un solo renglón en la tabla y da click en "send".

## Crea el objeto RSE
rse_gene_interactive <- create_rse(proj_info_interactive)

## Convirtamos las cuentas por nucleotido a cuentas por lectura
## usando compute_read_counts().
## Para otras transformaciones como RPKM y TPM, revisa transform_counts().
assay(rse_gene_SRP009615, "counts") <- compute_read_counts(rse_gene_SRP009615)

## Para este estudio en específico, hagamos más fácil de usar la
## información del experimento
rse_gene_SRP009615 <- expand_sra_attributes(rse_gene_SRP009615)
colData(rse_gene_SRP009615)[
  ,
  grepl("^sra_attribute", colnames(colData(rse_gene_SRP009615)))
]

# Observamos lo obtenido con iSEE y generamos una grafica.
library("iSEE")
iSEE::iSEE(rse_gene_SRP009615)

# Haciendo una comparación entre Assigned gene y mitoRate

m1 <- matrix(1:2, ncol = 2)
layout(m1)
boxplot(with(colData(rse_gene), tapply(totalAssignedGene, PrimaryDx, summary)), main= "AssignedGene",col = rainbow(10))
boxplot(with(colData(rse_gene), tapply(mitoRate, PrimaryDx, summary)), main= "mitoRate",col = rainbow(10))
