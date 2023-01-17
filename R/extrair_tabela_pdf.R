# Algoritmo para verificação e confirmação do status de ameaça 
# a nível nacional da fauna e flora brasileira
# 
# MBA em Data Science & Analytics - USP
# 
# Autora: Tawane Yara Nunes
# E-mail: taw.ynunes@gmail.com
# 

# EXTRAIR DADOS DE TABELAS CONTIDAS EM ARQUIVO PDF

# PACOTES ----

# library(remotes) # para ser possível baixar o pacote tabulizer a partir do repositório no github
# intalação do pacote
# remotes::install_github(c("ropensci/tabulizerjars", "ropensci/tabulizer"), INSTALL_opts = "--no-multiarch") 

library(tabulizer) # pacote para extração de dados do pdf
# para utilização do tabulizer é necessário o download do java via https://www.java.com/en/download/

library(tidyverse) # instala outros pacores do R, principalmente para 
# Manipulação de dados

# CHECAR SE OS PASSOS SEGUINTES SÃO NECESSÁRIOS ----
library(rJava) # necessário para utilização do tabulizer

# Criando um ambiente java 
Sys.setenv(JAVA_HOME="C:/Program Files/Java/jdk-18/")

library(remotes)
remotes::install_github(c("ropensci/tabulizerjars", "ropensci/tabulizer"), INSTALL_opts = "--no-multiarch") 



# EXTRAIR TABELA DO PDF ----

# criação de objeto com as páginas para facilitar entrada para usuário
paginas <- c(2:5) 

# extração das tabelas
tabela_especies <- extract_tables("./docs/lista_especies_ameacadas.pdf", 
                                  pages = paginas, # especificação das páginas
                                  output = "data.frame") # formato do resultado

# Obs.: O arquivo criado é uma lista o que significa que cada tabela é um item.


# TRANSFORMAR LISTA EM DATA FRAME ----
teste_extracao <- tabela_especies[[1]]

if (!dir.exists("dados/processados")) dir.create("dados/processados")

write.csv(teste_extracao, "dados/processados/teste_extracao.csv", 
          row.names = FALSE)

