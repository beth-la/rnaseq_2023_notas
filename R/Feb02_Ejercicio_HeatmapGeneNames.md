# EJERCICIO DE CLASE: Heatmap 

Cambiar los nombres de las rows del heatmap de modo que ahora muestre los nombres de los genes y no los ID

## Mi respuesta 

```R
# Generamos una funcion con lappy que nos permita buscar el nomre del gene segunel ID que se encuentra asociado a este. 
gene_names <- unlist(lapply(row.names(exprs_heatmap), function(id){
  index <- match(id,de_results$gene_id)
  return(de_results$gene_name[index])
}))

# Asegurarnos de que se obtuvieron los nombres correctamente:
length(gene_names) == length(row.names(exprs_heatmap))
[1] TRUE

# Reasignamos los nombres, reemplazando los IDs con los nombres de los genes. 
row.names(exprs_heatmap) <- gene_names
row.names(exprs_heatmap)

# Hacemos que se muestren en el heatmap con: show_rownames = TRUE,
library("pheatmap")
pheatmap(
  exprs_heatmap,
  cluster_rows = TRUE,
  cluster_cols = TRUE,
  show_rownames = TRUE,
  show_colnames = FALSE,
  annotation_col = df
)
 
# Comprobando que el codigo si hace lo que queremos:
# > row.names(exprs_heatmap)[1]
# [1] "ENSG00000004487.15"
# > match(row.names(exprs_heatmap)[1],de_results$gene_id)
# [1] 598
# > de_results$gene_id[598]
# [1] "ENSG00000004487.15"
# > de_results$gene_name[598]
#[1] "KDM1A"
```

![image-20230203092007565](C:\Users\Brenda Elizabeth L\AppData\Roaming\Typora\typora-user-images\image-20230203092007565.png)

## Respuesta vista en clase

```R
## Guardemos los IDs de nuestros 50 genes
nombres_originales <- rownames(exprs_heatmap)

## Con match() podemos encontrar cual es cual
rownames(exprs_heatmap) <- rowRanges(rse_gene_SRP045638)$gene_name[
    match(rownames(exprs_heatmap), rowRanges(rse_gene_SRP045638)$gene_id)
]

## Vean que tambien podriamos haber usado rank()
identical(
    which(rank(de_results$adj.P.Val) <= 50),
    match(nombres_originales, rowRanges(rse_gene_SRP045638)$gene_id)
)
```

