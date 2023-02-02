# Algoritmo para verificação e confirmação do status de ameaça 
# a nível nacional da fauna e flora brasileira
# 
# MBA em Data Science & Analytics - USP
# 
# Autora: Tawane Yara Nunes
# E-mail: taw.ynunes@gmail.com

# PACOTES ESPECÍFICOS -----------------------------------------------

library(xml2) # ler o html do site selecionado
library(rvest) # extrair os elementos do html
library(tidyverse) # instala outros pacores do R, principalmente para 
# Manipulação de dados

# IMPORTANTDO HTML -------------------------------------------------
# REFERENTE A PORTARIA MMA N° 148 
# ATUALIZAÇÃO DA LISTA DE ESPÉCIES AMEAÇADAS DE EXTINÇÃO

url <- "https://www.in.gov.br/en/web/dou/-/portaria-gm/mma-n-300-de-13-de-dezembro-de-2022-450425464" 

# EXTRAINDO TABELAS -------------------------------------------------

tabelas_portaria300 <- url %>% 
                       read_html() %>% 
                       html_nodes("table") %>% 
                       html_table(trim = T)

# conferinfo o número de colunas de cada tabela
View(tabelas_portaria300[[66]])
lapply(tabelas_portaria300, ncol)

# FLORA -------------------------------------------------------------

# após avaliar os data frames gerados é possivel observar que os dados
# referentes a flora estão contidos nos itens de 1 a 65 da lista.

lista_flora_P300 <- tabelas_portaria300[c(1:65)]
lapply(lista_flora_P300, ncol)
View(lista_flora_P300[[12]])
