
# Bienestar subjetivo y confianza social en Europa

## Descripcion del proyecto

Este proyecto analiza el bienestar subjetivo y la confianza interpersonal utilizando datos de la European Social Survey (ESS), Round 8 (2016), edicion 2.3.

El objetivo es explorar los niveles de felicidad, satisfaccion con la vida y confianza interpersonal, asi como sus diferencias entre paises y grupos de edad.

El trabajo se desarrolla en R y RStudio, aplicando procedimientos de importacion, limpieza, analisis y visualizacion reproducible de datos.

## Fuente de datos

European Social Survey (ESS), Round 8 (2016).

DOI: https://doi.org/10.21338/NSD-ESS8-2016

## Estructura del proyecto

- `Datos/`: base original, base depurada y codigo de limpieza.
- `Dashboard/`: dashboard interactivo elaborado con flexdashboard y plotly.
- `Informe/`: informe tecnico reproducible elaborado con R Markdown y knitr.
- `Presentacion/`: presentacion academica elaborada con R Markdown.

## Herramientas utilizadas

- R y RStudio
- dplyr
- tidyr
- ggplot2
- plotly
- flexdashboard
- crosstalk
- knitr
- rmarkdown

## Como reproducir el proyecto

La base de datos original ESS8e02_3.csv no se incluye en este repositorio debido a las limitaciones de tamaño de carga de GitHub.

Para reproducir el proceso completo de importación y depuración, es necesario:

Acceder al portal de datos de la European Social Survey.

Buscar y descargar los datos de ESS Round 8 (2016), edición 2.3, en formato CSV.

Guardar el archivo con el nombre ESS8e02_3.csv dentro de la carpeta Datos.

Ejecutar el script Datos/01_importacion_depuracion.R desde la carpeta principal del proyecto.

El repositorio incluye también Datos/ESS8_depurada.csv, por lo que es posible generar el dashboard, el informe y la presentación sin repetir previamente el proceso de limpieza.

1. Descargar o clonar el repositorio.
2. Abrir el proyecto de RStudio desde la carpeta principal.
3. Instalar los paquetes necesarios.
4. Ejecutar `Datos/01_importacion_depuracion.R` desde la carpeta principal del proyecto.
5. Abrir `Dashboard/dashboard.Rmd` y seleccionar Knit.
6. Abrir `Informe/informe_tecnico.Rmd` y seleccionar Knit.
7. Abrir `Presentacion/presentacion_ESS8.Rmd` y seleccionar Knit.

Los documentos HTML se generan a partir del codigo y los datos incluidos en el proyecto.

## Principales resultados

Las medias descriptivas no ponderadas obtenidas fueron:

- Felicidad: 7.44
- Satisfaccion con la vida: 7.15
- Confianza interpersonal: 5.27

Los resultados son exploratorios y no deben interpretarse como estimaciones representativas de toda la poblacion europea.

## Autora

Ana Valentina de la Serna
