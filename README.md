# Análisis Demográfico y Socioeconómico: Suiza (1888)

¡Bienvenido/a a este proyecto de análisis de datos! En este repositorio se presenta un estudio detallado sobre los factores socioeconómicos y demográficos que influyeron en el índice de fertilidad de 47 provincias de habla francesa en la Suiza de finales del siglo XIX (1888). 

El reporte final ha sido desarrollado de manera íntegra utilizando **Quarto** y **R**.

## Contenido del Proyecto

El análisis se centra en responder tres preguntas clave de investigación:
1. **Agricultura y Fertilidad:** ¿Cómo se relaciona la actividad agrícola con la fertilidad marital?
2. **Educación y Religión:** ¿De qué manera el acceso a la educación impacta la fertilidad al contrastar provincias mayormente católicas frente a protestantes?
3. **Mortalidad Infantil:** ¿Existe coexistencia entre una alta fertilidad y la tasa de mortalidad en el primer año de vida?

---

## Estructura del Repositorio

* `proyecto_final.qmd`: Archivo fuente de Quarto con la preparación de datos, código en R e interpretaciones.
* `proyecto_final.html`: Reporte interactivo final autogenerado.
* `figures/`: Carpeta que contiene las gráficas estadísticas exportadas de forma independiente (`.png`).
* `references.bib`: Archivo con las fuentes bibliográficas en formato BibTeX.

---

## Tecnologías y Paquetes Utilizados

Este proyecto requiere tener instalado **R** y **RStudio**, junto con las siguientes librerías del ecosistema `tidyverse`:
* `dplyr` — Para la manipulación y preparación de datos.
* `ggplot2` — Para la construcción de las gráficas de dispersión y líneas de tendencia.
* `tidyr` y `forcats` — Para el ordenamiento de variables.
* `rmarkdown` — Para habilitar el formato de tablas interactivas.

---

## Origen de los Datos

Los datos provienen del dataset precargado en R llamado `swiss`, extraído originalmente de estudios socio-demográficos históricos sobre el declive de la fertilidad en Europa (Wetherell, 2001).

---

## Autor

* **Loren Clavel Nolasco Hernández**
* *Proyecto Final*