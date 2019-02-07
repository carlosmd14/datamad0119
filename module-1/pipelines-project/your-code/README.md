# Consumo de cerveza en São Paulo, Brasil, durante el año 2015

## Procedimiento

El primer paso fue importar la base de datos, en este caso en formato CSV. Se añadió como parámetro " decimal="," " para que fuera importada teniendo en cuenta que en el fichero original los decimales estaban separados por comas en vez de por puntos.

#### El primer paso (función acquire) fue importar la base de datos, en este caso en formato CSV. Se añadió como parámetro " decimal="," " para que fuera importada teniendo en cuenta que en el fichero original los decimales estaban separados por comas en vez de por puntos.

#### Luego viene la limpieza de datos (función wrangle):

- Se eliminan las últimas filas, que contienen valores nulos.

- Se estandarizan los nombres de las columnas.

- Se crea una nueva columna con los días de la semana en letras, con los métodos to_datetime y weekday_name.

- Se hace un split para separar la fecha en año, mes y día, para luego hacer drop de la columna Year, ya que todas las filas que se tratarán serán del mismo año.

- Se reordenan las columnas.

- Se cambia el tipo de la columna Month a int y Consumption a float, para poder operar con ellas más adelante en los plot.

- Se transforman los números de los meses en palabras.

#### El siguiente paso es el análisis de los datos (función analyze):

- Se crea una subtabla mediante groupby del mes, para ver los valores medios de cada parámetro por mes.

- Se hace lo mismo pero para cada día de la semana.

- Luego se crean y guardan los gráficos realizados (función vis_save):

- Recibe como parámetros la tabla principal, la tabla agrupada por mes o día de la semana, y los nombres de los ejes. 

- Se usa la librería Seaborn para crear los gráficos, luego se guardan con savefig y se cierra el plot para poder operar con el siguiente desde el principio.

#### Por último, se concatena todo dentro del if __name__ == "__main__", accediendo a cada función.


## Conclusiones

Las hipótesis que podrían surgir antes de adentrarse en los datos son:

- ¿El consumo de cerveza aumenta o disminuye cuando hay más lluvia?

- ¿El consumo es más alto los fines de semana?

- ¿El consumo es más alto en algunos meses respecto a otros, por cantidad de festivos o vacaciones?

Al ver las diferentes tablas y gráficos, se puede llegar a las siguientes conclusiones respecto a dichas hipótesis:

- No se puede concluir que el consumo esté relacionado con la lluvia, ya que en la tabla en la que se agrupó el consumo tanto por mes como por día se puede apreciar que los valores de la lluvia son muy variados tanto para los días o meses con más consumo, como para los que menos.

- Se puede apreciar que los días sábado y domingo el consumo es considerablemente más alto que los demás días.

- Se puede ver que el consumo es más alto los meses de enero, octubre y diciembre, siendo el primero y el último meses caracterizados por las fiestas y reencuentros.

##### Nota:

Se empleó el método corr para estudiar la correlación pero como no se obtuvo ninguna correlación significativa, se omitieron los resultados del informe.

###### Comando crontab:

0 12 1 * * /home/carlosmd14/datamad0119/module-1/pipelines-project/your-code/main.py

Este comando hará que se guarden en la carpeta Output los gráficos los días 1 de cada mes a las 12 del mediodía.

###### Comando mail:

$ echo "Se anexan los gráficos actualizados" | mail -s "Gráficos Actualizados" ejemplo@example.com -A output/*