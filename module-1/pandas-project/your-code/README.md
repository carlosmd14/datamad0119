SharkAttackME.md
======


### Paso 0

Como en cada fichero en el que quiera usar las bibliotecas de Pandas y Numpy, el primer paso es importarlas.

### Paso 1

Importo el fichero que contiene los datos. Como casi todos, tuve el problema de la codificación UTF-8; lo abrí en excel como .csv, lo guardé con otro nombre, lo cerré, y al intentar importar este fichero con nuevo nombre sí me funcionó.

### Paso 2

Verifico si hay registros duplicados con drop_duplicates. En este caso no hay ninguno.

### Paso 3

Me deshago (.drop) de una serie de columnas de las cuales considero que no sacaré ningún provecho.

### Paso 4

Uso .isnull para verificar la cantidad de registros no válidos por cada columna.

### Paso 5

Me deshago (.drop) de las columnas Age y Time por la cantidad de registros nulos y de Date por la redundancia con Year.

### Paso 6

Utilizo .stats para tener algunas estadísticas. Pude notar que para los campos numéricos me enseña las estadísticas numéricas (media, suma, percentiles...) pero para los que no lo son, me ofrece estadísticas un poco más categóricas, como cuál es el que aparece con más frecuencia, cuál es esta frecuencia, y el número de registros únicos.

### Paso 7

Uso el .dtypes para conocer los tipos de los datos. Son todos object excepto Year, que como se podía esperar, es de un tipo numérico (float)

### Paso 8

Remuevo los registros no válidos de las columnas Country y Area.

### Paso 9

Uso .unique para visualizar cada registro único de los países.

### Paso 10

Hago limpieza de la columna Country, ya que hay algunos registros en minúsculas, y se eliminan/intercambian los caracteres extraños.

### Paso 11

Con value_counts se puede apreciar la cantidad de ataques que ha habido por país, con USA y Australia liderando claramente.

### Paso 12

Hago lo mismo con la columna que indica si el ataque fue fatal o no, pero por los valores que arroja tengo que hacerle una limpieza.

### Paso 13

Limpio la columna de fatalidad.

### Paso 14 

Vuelvo a imprimir el value_counts de la fatalidad, y esta vez sí se puede apreciar más limpiamente que la cantidad de ataques que sí fueron fatales es casi el triple que los que no. Una "pequeña" cantidad de ataques arroja UNKNOWN, pero no es una cantidad demasiado significativa en comparación con el total. Utilizo como parámetro de value_counts normalize=True, para que me muestre las proporciones, y luego lo multiplico todo por 100 para que se lean como porcentajes.

### Paso 15 

Con el comando ejecutado prentendo visualizar cuántos ataques fueron "provocados" por cada motivo. Se puede apreciar que la gran mayoría de ellos fueron no provocados.

### Paso 16

Hago binning con los años. El approach que hice fue una combinación entre equal width bins, ya que van por décadas desde el 1950, y custom-sized bins, ya que los ataques de antes del 1950 los metí todos en un solo contenedor, 'Others'.

### Paso 17 

Para ver qué cantidad quedó en cada bin, hago un value_counts, igualando el parámetro sort a False para que no lo ordene por orden de cantidad sino de nombre de bin (décadas). En un principio había puesto 0 como cutoff inferior y como algunos años eran 0 (los menores), al ejecutar la función pandas.cut categorizaba los 0 en NaN, por eso entendí que la función usa un mayor estricto, y no un mayor o igual.

### Paso 18

Muestro de nuevo un value_counts con los países para visualizar las proporciones (porcentajes).

### Paso 19

Se visualiza una relación entre los países y si los ataques fueron fatales o no. Al agregarle .sort_values(ascending=False) lo ordena de mayor a menor por la cantidad de N o Y, que si bien sin usarlo se puede apreciar cada N e Y de cada país, de esta forma se pueden ver los países que más ataques tienen y visualizar las diferencias entre los que sí fueron mortales y los que no. 

### Paso 20 

Guardo la tabla después de limpiar y manipular como 'Shark_After.csv'




Conclusiones
======


* En el paso 14 se puede observar que un 72% de los ataques no fueron fatales, o dicho de otra forma, casi un 26% resultaron en fallecimientos. Una forma de interpretar esto podría ser que, si alguien es atacado por un tiburón, tiene aproximadamente 72% de probabilidades de sobrevivir.

* De manera similar, en el paso 15 se puede apreciar que un 9% de los ataques fueron provocados, lo cual deja mucho margen para mejorar en cuanto a la actitud del humano frente a la fauna.

* En el paso 17, al visualizar los contenedores por año, se puede ver que un 28% de los datos registrados son de antes del año 1950, lo cual es una cantidad bastante importante. De entre las demás décadas, las que más ataques tienen reportados, con alrededor de 17 y 13 por ciento respectivamente, son las del 2000 y 2010, siendo de notar que la del 2010 solo incluye hasta el 2016, que es el año de los datos más nuevos, lo que puede ser ocasionado por una de dos cosas, o incluso por ambas: 

    * Hay más ataques últimamente, bien sea porque hay más humanos, o porque hay más acciones que los incitan; o porque...
    
    * En los últimos años se ha hecho cada vez más fácil el reportar y difundir cuando ocurre un ataque de este tipo.
    
* En el paso 18 se puede ver la representación de la cantidad de ataques por países en porcentajes, con un claro predominio de USA y de Australia, lo cual puede ser ocasionado por su gran longitud de costas en las que se pueden practicar deportes acuáticos (estar más expuesto)

* Por falta de tiempo y de familiarización con las herramientas no se hicieron más hipótesis y limpieza, pero ciertamente hay otras conclusiones que se podrían sacar de esta base de datos.
    
    
