library(dplyr)
library(ggplot2)
library(tidyr)
library(forcats)

data("swiss")

suiza <- as_tibble(swiss, rownames = "Provincias")

dim(suiza)

names(suiza)

colSums(is.na(suiza))

glimpse(suiza)

