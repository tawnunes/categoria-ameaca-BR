# Algoritmo para verificação e confirmação do status de ameaça 
# a nível nacional da fauna e flora brasileira
# 
# MBA em Data Science & Analytics - USP
# 
# Autora: Tawane Yara Nunes
# E-mail: taw.ynunes@gmail.com
# -------------------------------------------------------------------------------

# EXTRAIR DADOS DE TABELAS CONTIDAS EM ARQUIVO PDF

# PACOTES ----

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


# EXTRAIR TABELA DO PDF ----

# criação de objeto com as páginas para facilitar entrada para usuário
paginas <- c(98:101) 

# extração das tabelas
tabela_especies <- extract_tables("./docs/lista_especies_ameacadas.pdf", 
                                  pages = paginas, # especificação das páginas
                                  output = "data.frame") # formato do resultado

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

