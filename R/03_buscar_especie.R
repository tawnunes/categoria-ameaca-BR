# Lista Nacional de Espécies Ameaçadas Sob a Perspectiva do Acesso e 
# Processamento de Dados
# 
# MBA em Data Science & Analytics - USP
# 
# Autora: Tawane Yara Nunes
# E-mail: taw.ynunes@gmail.com

# FERRAMENTA DE BUSCA -----------------------------------------------

library(dplyr)
library(plumber)

# Carrega o dataframe
df <- read.csv("dados/processados/lista_especies_ameacadas_P148.csv")

#' Busca o valor esperado a partir do nome da espécie
#' 
#' @param nome_especie Nome da espécie para buscar o valor esperado
#' @post /buscar_especie
function(valor_pesquisa) {
 valor <- df %>%
  filter(especie == valor_pesquisa) %>%
  select(categoria_portaria148) %>%
  pull()
 return(valor)
}
