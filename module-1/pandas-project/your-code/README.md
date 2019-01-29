Shark.AttackME.md
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

Limpio la columna de fatalidad

### Paso 14

Vuelvo a imprimir el value_counts de la fatalidad, y esta vez sí se puede apreciar más limpiamente que la cantidad de ataques que sí fueron fatales es casi el triple que los que no. Una "pequeña" cantidad de ataques arroja UNKNOWN, pero no es una cantidad demasiado significativa en comparación con el total.

### Paso 15

Con el comando ejecutado prentendo visualizar cuántos ataques fueron "provocados" por cada motivo. Se puede apreciar que la gran mayoría de ellos fueron no provocados.

### Paso 16

Hago binning con los años. El approach que hice fue una combinación entre equal width bins, ya que van por décadas desde el 1950, y custom-sized bins, ya que los ataques de antes del 1950 los metí todos en un solo contenedor, 'Others'.

### Paso 17

Para ver qué cantidad quedó en cada bin, hago un value_counts, igualando el parámetro sort a False para que no lo ordene por orden de cantidad sino de nombre de bin (décadas).








Bins: al tratar de hacer bins por décadas, de la columna "Year", puse 0 como cutoff inferior y como algunos años eran 0 (los menores), al ejecutar la función pandas.cut categorizaba los 0 en NaN, por eso entendí que la función usa un mayor estricto, y no un mayor o igual que.