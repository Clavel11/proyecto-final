# ==============================================================================
# PROYECTO FINAL: ANÁLISIS DEMOGRÁFICO Y SOCIOECONÓMICO EN SUIZA (1888)
# Autor: Loren Clavel Nolasco Hernández
# ==============================================================================

# 2. Paquetes a utilizar -------------------------------------------------------
library(dplyr)
library(ggplot2)
library(tidyr)
library(forcats)

# 3. Carga de los datos --------------------------------------------------------
suiza <- as_tibble(swiss, rownames = "Provincias")

# 4. Exploración de los datos --------------------------------------------------
dim(suiza)
names(suiza)
glimpse(suiza)

# Mostrar las primeras 10 provincias (versión interactiva para reporte)
# rmarkdown::paged_table(head(suiza, 10))

# 5. Limpieza y Verificación ---------------------------------------------------
colSums(is.na(suiza)) # Verificación de valores faltantes

# 6. Preguntas de investigación ------------------------------------------------

# ---- a) Relación entre agricultura y fertilidad ----
tabla_preparacion_1 <- suiza %>% 
  select(Agriculture, Fertility) %>% 
  head(10)

print(tabla_preparacion_1)

grafica_1 <- ggplot(suiza, aes(x = Agriculture, y = Fertility)) +
  geom_point(color = "#4A5568", size = 3, alpha = 0.8) +
  geom_smooth(method = "lm", color = "#E53E3E", se = FALSE, size = 1.2) +
  labs(
    title = "Relación entre Agricultura y Fertilidad en Suiza (1888)",
    subtitle = "Análisis bidimensional de factores económicos y demográficos",
    x = "Hombres dedicados a la agricultura (%)",
    y = "Índice de fertilidad marital (Ig)"
  ) +
  theme_minimal()

print(grafica_1)
ggsave("figures/relacion-agricultura-fertilidad.png", plot = grafica_1, width = 8, height = 5)


# ---- b) Efecto de la fertilidad según la educación y la filiación religiosa ----
tabla_preparacion_2 <- suiza %>% 
  mutate(Religion_Dominante = if_else(Catholic > 50, "Católica", "Protestante")) %>% 
  select(Education, Fertility, Religion_Dominante) %>% 
  head(10)

print(tabla_preparacion_2)

# Nota: Recuerda usar la variable 'Religion_Dominante' en tu ggplot para mapear los colores
grafica_2 <- ggplot(suiza %>% mutate(Religion_Dominante = if_else(Catholic > 50, "Católica", "Protestante")), 
                    aes(x = Education, y = Fertility, color = Religion_Dominante)) +
  geom_point(size = 3, alpha = 0.8) +
  geom_smooth(method = "lm", se = FALSE, size = 1.2) +
  labs(
    title = "Efecto de la Educación en la Fertilidad según Religión",
    x = "Educación más allá de la primaria (%)",
    y = "Índice de fertilidad marital (Ig)",
    color = "Religión Dominante"
  ) +
  theme_minimal()

print(grafica_2)
ggsave("figures/relacion-educacion-fertilidad-religion.png", plot = grafica_2, width = 8, height = 5)


# ---- c) Relación entre la mortalidad infantil y la fertilidad ----
tabla_preparacion_3 <- suiza %>% 
  select(Infant.Mortality, Fertility) %>% 
  head(10)

print(tabla_preparacion_3)

grafica_3 <- ggplot(suiza, aes(x = Infant.Mortality, y = Fertility)) +
  geom_point(color = "#4A5568", size = 3, alpha = 0.8) +
  geom_smooth(method = "lm", color = "#3182CE", se = FALSE, size = 1.2) +
  labs(
    title = "Relación entre Mortalidad Infantil y Fertilidad",
    x = "Mortalidad Infantil (vivos que viven < 1 año)",
    y = "Índice de fertilidad marital (Ig)"
  ) +
  theme_minimal()

print(grafica_3)
ggsave("figures/relacion-mortInf-fertilidad.png", plot = grafica_3, width = 8, height = 5)

