# Algoritmo para verificação e confirmação do status de ameaça 
# a nível nacional da fauna e flora brasileira
# 
# MBA em Data Science & Analytics - USP
# 
# Autora: Tawane Yara Nunes
# E-mail: taw.ynunes@gmail.com

# Consulta na tabela

# PACOTES----------------------------------------------------------------
library(tidyverse)


# IMPORTANDO DADOS ------------------------------------------------------

especies_conferir <- read.csv("./dados/processados/teste_conferencia.csv")

lista_ameacadas <- read.csv("./dados/processados/lista_fauna.csv")

# CONFERINDO DADOS PORTARIA ------------------------------------------------------

conferido <- especies_conferir %>% left_join(lista_ameacadas, by = "especie") %>% 
                                   select(c(especie, categoria)) %>% 
                                   mutate(referencia = "Portaria MMA 148 de Julho de 2022")

# TESTE DA FUNÇÃO ---------------------------------------------------------------

source("./funcoes/statusICMBio.R")

statusICMBio(especies_conferir)
