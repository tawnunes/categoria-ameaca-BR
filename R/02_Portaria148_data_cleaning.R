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

flora_P148 <- read.csv("./dados/raw/lista_flora_raw.csv")

fauna_terrestre_P148 <- read.csv("./dados/raw/lista_fauna_terrestre_raw.csv")

fauna_aquatica_P148 <- read.csv("./dados/raw/lista_fauna_aquatica_raw.csv")

# DATA CLEANING -----------------------------------------------------------------------------

## FLORA ------------------------------------------------------------------------------------

flora_P148 <- flora_P148 %>% mutate(ID = as.numeric(ID), # transformando a coluna ID em numeric para facilitar a limpeza
                                lista_anterior = ifelse(lista_anterior == "*", "sim", "nao"),# alterando marcação de listagem anterior
                                componente = "Flora") %>% # marcando o componente
                         filter(!is.na(ID))  # excluindo linhas que não contém ID númerico
# Estas linhas são geradas por cabeçalhos e outras informações na tabela

## FAUNA --------------------------------------------------------------------------------------

### FAUNA TERRESTRE -----------------------------------------------------------------------------------------------------------

fauna_terrestre_P148 <- fauna_terrestre_P148 %>% mutate(ID = as.numeric(ID), # transformando a coluna ID em numeric para facilitar a limpeza
                                                        lista_anterior = ifelse(lista_anterior == "*", "sim", "nao"),# alterando marcação de listagem anterior
                                                        componente = "Fauna", # marcando o componente
                                                        grupo = ifelse(ID >= 1 & ID <= 275, "Invertebrados terrestres", 
                                                                       ifelse(ID >= 276 & ID <= 334 , "Anfibios",
                                                                              ifelse(ID >= 335 & ID <= 405, "Repteis",
                                                                                     ifelse(ID >= 406 & ID <= 662, "Aves",
                                                                                            ifelse(ID >= 663 & ID <= 764, "Mamiferos", 
                                                                                                   NA)))))) %>%  # marcando os grupo
                                                 filter(!is.na(ID)) # excluindo linhas que não contém ID númerico
# Estas linhas são geradas por cabeçalhos e outras informações na tabela

### FAUNA AQUATICA ---------------------------------------------------------------------------------------------------

fauna_aquatica_P148 <- fauna_aquatica_P148 %>% mutate(ID = as.numeric(ID), # transformando a coluna ID em numeric para facilitar a limpeza
                                                        lista_anterior = ifelse(lista_anterior == "*", "sim", "nao"),# alterando marcação de listagem anterior
                                                        componente = "Fauna", # marcando o componente
                                                        grupo = ifelse(ID >= 1 & ID <= 97, "Invertebrados aquaticos", 
                                                                       ifelse(ID >= 98 & ID <= 485 , "Peixes", NA))) %>%  # marcando os grupo
 filter(!is.na(ID)) # excluindo linhas que não contém ID númerico
# Estas linhas são geradas por cabeçalhos e outras informações na tabela


# UNINDO OS DOIS GRUPOS ---------------------------------------------------------------------

lista_ameaca_BR_P148 <- df_fauna_P148 %>% bind_rows(df_flora_P148) %>% 
                                          select(c(grupo, especie, familia, ordem, categoria, lista_anterior)) %>% 
                                          rename(categoria_portaria148 = categoria)



# EXPORTANDO OS DADOS GERADOS ---------------------------------------------------------------

# EXPORTANDO TABELA DE RESULTADOS -----

if (!dir.exists("dados/processados/portaria_148")) dir.create("dados/processados/portaria_148")

write.csv(df_flora_P148, "dados/processados/portaria_148/lista_flora_148.csv", 
          row.names = FALSE)

write.csv(df_fauna_P148, "dados/processados/portaria_148/lista_fauna.csv", 
          row.names = FALSE)

write.csv(lista_ameaca_BR_148, "dados/processados/portaria_148/lista_especies_ameacadas_P148.csv", 
          row.names = FALSE)
