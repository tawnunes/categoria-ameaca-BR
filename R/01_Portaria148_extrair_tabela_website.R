# Algoritmo para verificação e confirmação do status de ameaça 
# a nível nacional da fauna e flora brasileira
# 
# MBA em Data Science & Analytics - USP
# 
# Autora: Tawane Yara Nunes
# E-mail: taw.ynunes@gmail.com

# PACOTES ESPECÍFICOS -----------------------------------------------

# library(xml2) # ler o html do site selecionado
library(rvest) # extrair os elementos do html
library(tidyverse) # instala outros pacores do R, principalmente para 
# Manipulação de dados

# IMPORTANTDO HTML -------------------------------------------------
# REFERENTE A PORTARIA MMA N° 148 
# ATUALIZAÇÃO DA LISTA DE ESPÉCIES AMEAÇADAS DE EXTINÇÃO

url <- "https://www.in.gov.br/en/web/dou/-/portaria-mma-n-148-de-7-de-junho-de-2022-406272733" 

# EXTRAINDO TABELAS -------------------------------------------------

tabelas_portaria148 <- url %>% 
                    read_html() %>% 
                    html_nodes("table") %>% 
                    html_table(trim = T)

# conferinfo o número de colunas de cada tabela
View(tabelas_portaria148[[20]])
lapply(tabelas_portaria148, ncol)

# FLORA -------------------------------------------------------------

# após avaliar os data frames gerados é possivel observar que os dados
# referentes a flora estão contidos nos itens de 1 a 14 da lista.

lista_flora <- tabelas_portaria148[c(1:14)]
lapply(lista_flora, ncol)
# View(lista_flora[[1]])

# excluindo cabeçalho da tabela
lista_flora[[1]] <- lista_flora[[1]][-c(1,2),]
# View(lista_flora[[1]])

# Mudandos para mesma classe todas as colunas
# Passo necessário para juntar os data frames sem erros
lista_flora <- lapply(lista_flora, function(x) { # aplicando a função em todos os data frames da lista
  lapply(x, as.character) # aplicando a função em todas as colunas do data frame
})

# Juntando todos os data frames da lista
df_flora <- bind_rows(lista_flora)

# Renomeando as colunas com os dados da primeira linha
nomes_flora <- c("ID", "lista_anterior", "familia", "especie", "categoria")
names(df_flora) <- nomes_flora

str(df_flora)

# FAUNA -------------------------------------------------------------

## FAUNA TERRESTRE ---------------------------------------------------
# após avaliar os data frames gerados é possivel observar que os dados
# referentes a fauna terrestre estão contidos nos itens de 15 a 19 da lista.

lista_fauna_terrestre <- tabelas_portaria148[c(15:19)]
#View(lista_fauna_terrestre[[20]])

lapply(lista_fauna_terrestre, ncol) # é possível observar que todos os dataframe tem 6 colunas
# exceto o data frame 5 que apresenta 11 colunas devido a repetição
# View(lista_fauna_terrestre[[5]])

# selecionando apenas as colunas de interesse e renomeando para facilitar a junção dos data frames
lista_fauna_terrestre[[5]] <- lista_fauna_terrestre[[5]] %>% select(-c(4,6,8,10,11)) %>% 
                                         rename(X4 = X5,
                                                X5 = X7,
                                                X6 = X9)


# Mudandos para mesma classe todas as colunas
# Passo necessário para juntar os data frames sem erros
lista_fauna_terrestre <- lapply(lista_fauna_terrestre, function(x) { # aplicando a função em todos os data frames da lista
 lapply(x, as.character) # aplicando a função em todas as colunas do data frame
})

# Juntando todos os data frames da lista
df_fauna_terrestre<- bind_rows(lista_fauna_terrestre)


# Alterando os nomes das colunas
nomes_fauna <- c("ID", "lista_anterior", "ordem", "familia", "especie", "categoria")

names(df_fauna_terrestre) <- nomes_fauna


## FAUNA AQUATICA ---------------------------------------------------
# após avaliar os data frames gerados é possivel observar que os dados
# referentes a fauna aquatica estão contidos nos itens de 20 a 22 da lista.

lista_fauna_aquatica <- tabelas_portaria148[c(20:22)]
# View(lista_fauna_aquatica[[1]])

lapply(lista_fauna_aquatica, ncol) 

# Mudandos para mesma classe todas as colunas
# Passo necessário para juntar os data frames sem erros
lista_fauna_aquatica <- lapply(lista_fauna_aquatica, function(x) { # aplicando a função em todos os data frames da lista
 lapply(x, as.character) # aplicando a função em todas as colunas do data frame
})


# Juntando todos os data frames da lista
df_fauna_aquatica <- bind_rows(lista_fauna_aquatica)


# Alterando os nomes das colunas
names(df_fauna_aquatica) <- nomes_fauna


# EXPORTANDO DADOS BRUTOS-------------------
if (!dir.exists("dados/raw")) dir.create("dados/raw")

write.csv(df_flora, "dados/raw/lista_flora_raw.csv", 
          row.names = FALSE)

write.csv(df_fauna_terrestre, "dados/raw/lista_fauna_terrestre_raw.csv", 
          row.names = FALSE)

write.csv(df_fauna_aquatica, "dados/raw/lista_fauna_aquatica_raw.csv", 
          row.names = FALSE)
