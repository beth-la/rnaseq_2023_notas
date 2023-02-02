# Ejemplo 3 visto en clase sobre cowplot.

(sampleData = data.frame(
  condition = factor(rep(c("ctrl_minus", "ctrl_plus", 
                           "ko_minus", "ko_plus"), 3)),
  batch = factor(rep(1:6, each = 2))))
#>     condition batch
#> 1  ctrl_minus     1
#> 2   ctrl_plus     1
#> 3    ko_minus     2
#> 4     ko_plus     2
#> 5  ctrl_minus     3
#> 6   ctrl_plus     3
#> 7    ko_minus     4
#> 8     ko_plus     4
#> 9  ctrl_minus     5
#> 10  ctrl_plus     5
#> 11   ko_minus     6
#> 12    ko_plus     6

# Agregar (0 +) elimina a conceptor.
vd <- VisualizeDesign(sampleData = sampleData,
                      designFormula = ~ 0 + batch + condition, 
                      textSizeFitted = 4, lineWidthFitted = 20, 
                      dropCols = "conditionko_minus")
cowplot::plot_grid(plotlist = vd$plotlist, ncol = 1)