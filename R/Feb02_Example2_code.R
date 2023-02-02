## Segundo ejemplo con ExploreModelMatrix

(sampleData <- data.frame(
  Response = rep(c("Resistant", "Sensitive"), c(12, 18)),
  Patient = factor(rep(c(1:6, 8, 11:18), each = 2)),
  Treatment = factor(rep(c("pre","post"), 15)), 
  ind.n = factor(rep(c(1:6, 2, 5:12), each = 2))))

#>     Response Patient Treatment ind.n
#> 1  Resistant       1       pre     1
#> 2  Resistant       1      post     1
#> 3  Resistant       2       pre     2
#> 4  Resistant       2      post     2
#> 5  Resistant       3       pre     3
#> 6  Resistant       3      post     3
#> 7  Resistant       4       pre     4
#> 8  Resistant       4      post     4
#> 9  Resistant       5       pre     5
#> 10 Resistant       5      post     5
#> 11 Resistant       6       pre     6
#> 12 Resistant       6      post     6
#> 13 Sensitive       8       pre     2
#> 14 Sensitive       8      post     2
#> 15 Sensitive      11       pre     5
#> 16 Sensitive      11      post     5
#> 17 Sensitive      12       pre     6
#> 18 Sensitive      12      post     6
#> 19 Sensitive      13       pre     7
#> 20 Sensitive      13      post     7
#> 21 Sensitive      14       pre     8
#> 22 Sensitive      14      post     8
#> 23 Sensitive      15       pre     9
#> 24 Sensitive      15      post     9
#> 25 Sensitive      16       pre    10
#> 26 Sensitive      16      post    10
#> 27 Sensitive      17       pre    11
#> 28 Sensitive      17      post    11
#> 29 Sensitive      18       pre    12
#> 30 Sensitive      18      post    12
vd <- VisualizeDesign(
  sampleData = sampleData,
  designFormula = ~ Response + Response:ind.n + Response:Treatment,
  textSizeFitted = 3
)
cowplot::plot_grid(plotlist = vd$plotlist, ncol = 1)