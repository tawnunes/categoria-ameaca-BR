# Algoritmo para verificação e confirmação do status de ameaça 
# a nível nacional da fauna e flora brasileira
# 
# MBA em Data Science & Analytics - USP
# 
# Autora: Tawane Yara Nunes
# E-mail: taw.ynunes@gmail.com
# 
# Requerimentos: execução do sprit "extrair_tabela_website.R"

# PACOTES ESPECÍFICOS -----------------------------------------------------------------------

library(tidyverse)

# IMPORTANTO DADOS BRUTOS -------------------------------------------------------------------

df_flora <- read.csv("./dados/raw/lista_flora_raw.csv")

df_fauna <- read.csv("./dados/raw/lista_fauna_raw.csv")

# DATA CLEANING -----------------------------------------------------------------------------

## FLORA ------------------------------------------------------------------------------------

df_flora <- df_flora %>% mutate(ID = as.numeric(ID), # transformando a coluna ID em numeric para facilitar a limpeza
                                lista_anterior = ifelse(lista_anterior == "*", "sim", "nao"),# alterando marcação de listagem anterior
                                grupo = "Flora") %>% # marcando o grupo
                         filter(!is.na(ID))  # excluindo linhas que não contém ID númerico
# Estas linhas são geradas por cabeçalhos e outras informações na tabela

## FAUNA --------------------------------------------------------------------------------------


df_fauna <- df_fauna %>% mutate(ID = as.numeric(ID), # transformando a coluna ID em numeric para facilitar a limpeza
                                    lista_anterior = ifelse(lista_anterior == "*", "sim", "nao"),# alterando marcação de listagem anterior
                                grupo = "Fauna") %>%  # marcando o grupo 
                             filter(!is.na(ID)) # excluindo linhas que não contém ID númerico
# Estas linhas são geradas por cabeçalhos e outras informações na tabela

# UNINDO OS DOIS GRUPOS ---------------------------------------------------------------------

lista_ameaca_BR <- df_fauna %>% bind_rows(df_flora) %>% select(c(grupo, especie, familia, ordem, categoria, lista_anterior)) 



# EXPORTANDO OS DADOS GERADOS ---------------------------------------------------------------

# EXPORTANDO TABELA DE RESULTADOS -----

if (!dir.exists("dados/processados")) dir.create("dados/processados")

write.csv(df_flora, "dados/processados/lista_flora.csv", 
          row.names = FALSE)

write.csv(df_fauna, "dados/processados/lista_fauna.csv", 
          row.names = FALSE)

write.csv(lista_ameaca_BR, "dados/processados/lista_especies_ameacadas.csv", 
          row.names = FALSE)
