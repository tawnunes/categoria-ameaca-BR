# Lista Nacional de Espécies Ameaçadas Sob a Perspectiva do Acesso e 
# Processamento de Dados
# 
# MBA em Data Science & Analytics - USP
# 
# Autora: Tawane Yara Nunes
# E-mail: taw.ynunes@gmail.com

# FERRAMENTA DE BUSCA -----------------------------------------------

library(dplyr)

# Carrega o dataframe
df <- read.csv("dados/processados/lista_especies_ameacadas_P148.csv")

# Define uma função que recebe o valor de pesquisa e retorna o valor correspondente
buscar_especie <- function(valor_pesquisa) {
 valor <- df %>%
  filter(especie == valor_pesquisa) %>%
  select(categoria_portaria148) %>%
  pull()
 return(valor)
}

# Obtém o valor de pesquisa a partir do formulário HTML
valor_pesquisa <- req$QUERY_STRING
valor_pesquisa <- strsplit(valor_pesquisa, "=")[[1]][2]

# Chama a função buscar_valor e retorna o resultado para o usuário
valor_retornado <- buscar_valor(valor_pesquisa)
cat(valor_retornado)
