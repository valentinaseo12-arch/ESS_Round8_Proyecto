
# M8 Reto 2 - Proyecto de Ciencia de Datos Reproducible
# European Social Survey - Round 8 (2016)
# Importacion de la base de datos original

# Comprobar que el archivo existe
file.exists("Datos/ESS8e02_3.csv")

# Importar la base de datos
ess8 <- read.csv(
  "Datos/ESS8e02_3.csv",
  stringsAsFactors = FALSE
)

# Comprobar las dimensiones de la base
dim(ess8)

# Visualizar los nombres de las variables
names(ess8)

# Visualizar las primeras observaciones
head(ess8)


# Exploracion de variables del proyecto

# Seleccionar variables de interes
variables <- c(
  "cntry",
  "stflife",
  "happy",
  "ppltrst",
  "agea",
  "eisced"
)

# Comprobar que existen en la base
variables %in% names(ess8)

# Obtener un resumen descriptivo
summary(ess8[variables])

# Consultar las categorias de pais
table(ess8$cntry, useNA = "ifany")


# Identificacion de codigos especiales
# en las variables seleccionadas

# Satisfaccion con la vida
table(ess8$stflife, useNA = "ifany")

# Felicidad
table(ess8$happy, useNA = "ifany")

# Confianza interpersonal
table(ess8$ppltrst, useNA = "ifany")

# Edad
table(ess8$agea, useNA = "ifany")

# Nivel educativo
table(ess8$eisced, useNA = "ifany")


# Depuracion de las variables principales

# Crear una copia de la base original
ess8_limpia <- ess8

# Variables de bienestar y confianza social
indicadores <- c("stflife", "happy", "ppltrst")

# Sustituir codigos especiales por NA
for (variable in indicadores) {
  ess8_limpia[[variable]][
    ess8_limpia[[variable]] %in% c(77, 88, 99)
  ] <- NA
}

# Comprobar la limpieza
summary(ess8_limpia[indicadores])

# Contar valores ausentes
colSums(is.na(ess8_limpia[indicadores]))


# Revision de edad y nivel educativo

# Identificar valores especiales de edad
table(ess8_limpia$agea[
  ess8_limpia$agea >= 100
], useNA = "ifany")

# Identificar las categorias educativas
table(ess8_limpia$eisced, useNA = "ifany")

# Comprobar los valores ausentes actuales
colSums(is.na(
  ess8_limpia[c("agea", "eisced")]
))


# Depuracion de edad y nivel educativo

# Convertir el codigo 999 de edad en NA
ess8_limpia$agea[
  ess8_limpia$agea == 999
] <- NA

# Convertir codigos especiales de educacion en NA
ess8_limpia$eisced[
  ess8_limpia$eisced %in% c(55, 77, 88, 99)
] <- NA

# Comprobar los resultados de la depuracion
summary(ess8_limpia[
  c("stflife", "happy", "ppltrst", "agea", "eisced")
])

# Contar los valores ausentes
colSums(is.na(ess8_limpia[
  c("stflife", "happy", "ppltrst", "agea", "eisced")
]))


# Guardar la base de datos depurada

# Seleccionar las variables necesarias para el proyecto
datos_proyecto <- ess8_limpia[
  c("cntry", "stflife", "happy",
    "ppltrst", "agea", "eisced")
]

# Exportar la base depurada a CSV
write.csv(
  datos_proyecto,
  "Datos/ESS8_depurada.csv",
  row.names = FALSE,
  na = ""
)

# Comprobar que el archivo se creo correctamente
file.exists("Datos/ESS8_depurada.csv")

# Comprobar las dimensiones
dim(datos_proyecto)


# Crear grupos de edad para el analisis

datos_proyecto$grupo_edad <- cut(
  datos_proyecto$agea,
  breaks = c(14, 29, 44, 64, Inf),
  labels = c(
    "15-29",
    "30-44",
    "45-64",
    "65 o mas"
  ),
  right = TRUE
)

# Comprobar la distribucion por grupos
table(datos_proyecto$grupo_edad, useNA = "ifany")

# Guardar nuevamente la base depurada
write.csv(
  datos_proyecto,
  "Datos/ESS8_depurada.csv",
  row.names = FALSE,
  na = ""
)

# Comprobar las dimensiones
dim(datos_proyecto)
