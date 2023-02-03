# EJERCICIO DE CLASE: Heatmap 

Cambiar los nombres de las rows del heatmap de modo que ahora muestre los nombres de los genes y no los ID

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