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

df_flora_P148 <- read.csv("./dados/raw/lista_flora_raw.csv")

df_fauna_P148 <- read.csv("./dados/raw/lista_fauna_raw.csv")

# DATA CLEANING -----------------------------------------------------------------------------

## FLORA ------------------------------------------------------------------------------------

df_flora_P148 <- df_flora_P148 %>% mutate(ID = as.numeric(ID), # transformando a coluna ID em numeric para facilitar a limpeza
                                lista_anterior = ifelse(lista_anterior == "*", "sim", "nao"),# alterando marcação de listagem anterior
                                grupo = "Flora") %>% # marcando o grupo
                         filter(!is.na(ID))  # excluindo linhas que não contém ID númerico
# Estas linhas são geradas por cabeçalhos e outras informações na tabela

## FAUNA --------------------------------------------------------------------------------------


df_fauna_P148 <- df_fauna_P148 %>% mutate(ID = as.numeric(ID), # transformando a coluna ID em numeric para facilitar a limpeza
                                    lista_anterior = ifelse(lista_anterior == "*", "sim", "nao"),# alterando marcação de listagem anterior
                                grupo = "Fauna") %>%  # marcando o grupo 
                             filter(!is.na(ID)) # excluindo linhas que não contém ID númerico
# Estas linhas são geradas por cabeçalhos e outras informações na tabela

# UNINDO OS DOIS GRUPOS ---------------------------------------------------------------------

lista_ameaca_BR_P148 <- df_fauna_P148 %>% bind_rows(df_flora_P148) %>% 
                                          select(c(grupo, especie, familia, ordem, categoria, lista_anterior)) %>% 
                                          rename(Portaria_148_07.06.22 = categoria)



# EXPORTANDO OS DADOS GERADOS ---------------------------------------------------------------

# EXPORTANDO TABELA DE RESULTADOS -----

if (!dir.exists("dados/processados/portaria_148")) dir.create("dados/processados/portaria_148")

write.csv(df_flora_P148, "dados/processados/portaria_148/lista_flora_148.csv", 
          row.names = FALSE)

write.csv(df_fauna_P148, "dados/processados/portaria_148/lista_fauna.csv", 
          row.names = FALSE)

write.csv(lista_ameaca_BR_148, "dados/processados/portaria_148/lista_especies_ameacadas_P148.csv", 
          row.names = FALSE)
