# Lista Nacional de Espécies Ameaçadas Sob a Perspectiva do Acesso e 
# Processamento de Dados
# 
# MBA em Data Science & Analytics - USP
# 
# Autora: Tawane Yara Nunes
# E-mail: taw.ynunes@gmail.com


# IMPORTANTDO HTML -------------------------------------------------
# REFERENTE A PORTARIA MMA N° 148 

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

## FAUNA GERAL ---------------------------------------------------
# após avaliar os data frames gerados é possivel observar que os dados
# referentes a fauna terrestre estão contidos nos itens de 15 a 19 da lista.

lista_fauna_geral <- tabelas_portaria148[c(15:19)]


lapply(lista_fauna_geral, ncol) # é possível observar que todos os data frames tem 6 colunas
# exceto o data frame 5 que apresenta 11 colunas devido a repetição
# View(lista_fauna_terrestre[[5]])

# selecionando apenas as colunas de interesse e renomeando para facilitar a junção dos data frames
lista_fauna_geral[[5]] <- lista_fauna_geral[[5]] %>% select(-c(4,6,8,10,11)) %>% 
                                                     rename(X4 = X5,
                                                            X5 = X7,
                                                            X6 = X9)


# Mudandos para mesma classe todas as colunas
# Passo necessário para juntar os data frames sem erros
lista_fauna_geral <- lapply(lista_fauna_geral, function(x) { # aplicando a função em todos os data frames da lista
 lapply(x, as.character) # aplicando a função em todas as colunas do data frame
})

# Juntando todos os data frames da lista
df_fauna_geral<- bind_rows(lista_fauna_geral)


# Alterando os nomes das colunas
nomes_fauna <- c("ID", "lista_anterior", "ordem", "familia", "especie", "categoria")

names(df_fauna_geral) <- nomes_fauna


## INVERTEBRADOS AQUÁTICOS E PEIXES ---------------------------------------------------
# após avaliar os data frames gerados é possivel observar que os dados
# referentes a invertebrados aquáticos e peixes estão contidos nos itens de 20 a 22 da lista.

lista_invert_peixes <- tabelas_portaria148[c(20:22)]
# View(lista_fauna_aquatica[[1]])

lapply(lista_invert_peixes, ncol) 

# Mudandos para mesma classe todas as colunas
# Passo necessário para juntar os data frames sem erros
lista_invert_peixes <- lapply(lista_invert_peixes, function(x) { # aplicando a função em todos os data frames da lista
 lapply(x, as.character) # aplicando a função em todas as colunas do data frame
})


# Juntando todos os data frames da lista
df_invert_peixes <- bind_rows(lista_invert_peixes)


# Alterando os nomes das colunas
names(df_invert_peixes) <- nomes_fauna


# EXPORTANDO DADOS BRUTOS-------------------
if (!dir.exists("dados/raw")) dir.create("dados/raw")

write.csv(df_flora, "dados/raw/lista_flora_raw.csv", 
          row.names = FALSE)

write.csv(df_fauna_geral, "dados/raw/lista_fauna_geral_raw.csv", 
          row.names = FALSE)

write.csv(df_invert_peixes, "dados/raw/lista_invert_peixes_raw.csv", 
          row.names = FALSE)

rm(list=ls()) # limpando o environment
