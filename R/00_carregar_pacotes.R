# Lista Nacional de Espécies Ameaçadas Sob a Perspectiva do Acesso e 
# Processamento de Dados
# 
# MBA em Data Science & Analytics - USP
# 
# Autora: Tawane Yara Nunes
# E-mail: taw.ynunes@gmail.com

# Carregamento de todos os pacotes necessários a execução deste projeto

pacotes <- c("tidyverse", # instala outros pacores do R, principalmente  
             # para anipulação de dados
             "xml2",
             "rvest",
             "ggplot2"
             ) 


if(sum(as.numeric(!pacotes %in% installed.packages())) != 0){
 instalador <- pacotes[!pacotes %in% installed.packages()]
 for(i in 1:length(instalador)) {
  install.packages(instalador, dependencies = T)
  break()}
 sapply(pacotes, require, character = T) 
} else {
 sapply(pacotes, require, character = T)}

rm(pacotes) # limpar o ambiente para as proximas etapas 
