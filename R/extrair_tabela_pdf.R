# Algoritmo para verificação e confirmação do status de ameaça 
# a nível nacional da fauna e flora brasileira
# 
# MBA em Data Science & Analytics - USP
# 
# Autora: Tawane Yara Nunes
# E-mail: taw.ynunes@gmail.com


# OBJETIVO -----------------------------------------------------------------------------

# EXTRAIR DADOS DE TABELAS CONTIDAS EM ARQUIVO PDF REFERENTE A
# PORTARIA MMA N° 148, DE 7 DE JUNHO DE 2022 DISPONÍVEL EM:


# PACOTES ------------------------------------------------------------------------------

# library(remotes) # para ser possível baixar o pacote tabulizer a partir do repositório 
# no github
# intalação do pacote
# remotes::install_github(c("ropensci/tabulizerjars", "ropensci/tabulizer"), INSTALL_opts = "--no-multiarch") 

library(tabulizer) # pacote para extração de dados do pdf
# para utilização do tabulizer é necessário o download do java via https://www.java.com/en/download/

library(tidyverse) # instala outros pacores do R, principalmente para 
# Manipulação de dados

# CHECAR SE OS PASSOS SEGUINTES SÃO NECESSÁRIOS ----
#library(rJava) # necessário para utilização do tabulizer

# Criando um ambiente java 
# Sys.setenv(JAVA_HOME="C:/Program Files/Java/jdk-18/")


# EXTRAIR TABELAS DO PDF POR GRUPO TAXONÔMICO ------------------------------------------------

## FLORA -------------------------------------------------------------------------------------

### FUNÇÃO EXTRACT_TABLES -----------
# extração das tabelas referentes a flora listada na portaria n° 148

flora_lista <- extract_tables("./docs/lista_especies_ameacadas.pdf", 
                                  pages = c(2:8), # especificação das páginas
                                  method = "stream",
                                  output = "matrix") # formato do resultado

# Checar o número de colunas de todos os dataframes
lapply(flora_lista, ncol) # todas deveriam ter o mesmo número de colunas
View(flora_lista[[6]])
# Excluir colunas que contenham apenas NA
# Erro gerado devido a formatação das colunas no pdf
flora_semNA <- lapply(flora_lista, function(x) x[,colSums(is.na(x)) != nrow(x)] )
lapply(flora_semNA, function(x) ncol(x) != 5)
View(flora_semNA[[6]])



# EXCLUIR DATA FRAMES DESNECESSÁRIOS -----
# visualização
lapply(tabela_especies, View)

# Excluir

tabela_especies <- tabela_especies[-1] # Descomentar se necessário

# conferindo se é o dataframe com o nome das colunas

# TRANSFORMAR LISTA EM DATA FRAME ----

# RENOMEANDO COLUNAS
nome_colunas <- c("ID","lista anterior","familia", "espécie ou subspecie","categoria")

# Capturando o nome das colunas contidos na primera parte da tabela
nome_colunas <- colnames(tabela_especies[[1]])
# Aplicando o mesmo nome de coluna em todas os data frames da lista
to_df <- lapply(tabela_especies, setNames, nome_colunas)
lapply(to_df, View)


# TRANFORMANDO O RESULTADO EM UM DATA FRAME
df_epecies <- bind_rows(to_df)


# EXPORTANDO TABELA DE RESULTADOS -----
if (!dir.exists("dados/processados")) dir.create("dados/processados")

write.csv(df_epecies, "dados/processados/teste_extracao.csv", 
          row.names = FALSE)

