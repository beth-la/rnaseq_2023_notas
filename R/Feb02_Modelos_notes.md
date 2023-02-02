# Modelos estadísticos en R

Código con el que estudiaremos regresiones lineales y modelos estadísticos:

```
# Creando una matriz
mat <- with(trees, model.matrix(log(Volume) ~ log(Height) + log(Girth)))
mat
colnames(mat)

# Corriendo lo anterior obtenemos:
> colnames(mat)
[1] "(Intercept)" "log(Height)" "log(Girth)" 
# Donde Intercept se refiere a la intersección con el eje de las y, es decir, la coordenada al origen. 
```

## Paquete: Graphical Exploration of Design Matrices

Exploración interactiva, de los mismos autores de iSEE

Genera un ambiente visual agradable para analizar datos.

![image-20230202095635245](C:\Users\Brenda Elizabeth L\AppData\Roaming\Typora\typora-user-images\image-20230202095635245.png)

## Ejercicio:

- Interpreta `ResponseResistant.Treatmentpre` del ejercicio 2. Puede ser útil tomar un *screenshot* (captura de pantalla) y anotarla con líneas de colores. Si haces eso, puedes incluir la imagen en tus notas.

![image-20230202102354176](C:\Users\Brenda Elizabeth L\AppData\Roaming\Typora\typora-user-images\image-20230202102354176.png)

ResponseResistant:Treatmentpre corresponde a la resta de la columna pre, menos a columna post. 

- ¿Por qué es clave el `0` al inicio de la fórmula en el ejercicio 3?

  Sin el 0, se agrega un coeficiente para el intercepto y se pierde a batch1 ya que este se toma como referencia. 

## Ejercicio Datos de SRP045638

rin: arn integrity number 

![image-20230202105507231](C:\Users\Brenda Elizabeth L\AppData\Roaming\Typora\typora-user-images\image-20230202105507231.png)

![image-20230202105750409](C:\Users\Brenda Elizabeth L\AppData\Roaming\Typora\typora-user-images\image-20230202105750409.png)

RPKM: Normaliza por la longitud de genes.

## Lima 

Función voom: para experimentos con pocas muestras que necesite explicar co-varianza.

Lima permite graficar, generando figuras como graficas volcán. 

## Alunas funciones

- plotExplanatoryVariables: Eje x en logaritmo base 10 

- model.matrix: hace la función de with

  
