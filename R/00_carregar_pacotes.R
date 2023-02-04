# Algoritmo para verificação e confirmação do status de ameaça 
# a nível nacional da fauna e flora brasileira
# 
# MBA em Data Science & Analytics - USP
# 
# Autora: Tawane Yara Nunes
# E-mail: taw.ynunes@gmail.com

# Carregamento de todos os pacotes necessários a execução deste projeto

pacotes <- c("tidyverse", # instala outros pacores do R, principalmente  
             # para anipulação de dados
             "xml2",
             "rvest"
             ) 


if(sum(as.numeric(!pacotes %in% installed.packages())) != 0){
 instalador <- pacotes[!pacotes %in% installed.packages()]
 for(i in 1:length(instalador)) {
  install.packages(instalador, dependencies = T)
  break()}
 sapply(pacotes, require, character = T) 
} else {
 sapply(pacotes, require, character = T)}

rm() # limpar o ambiente para as proximas etapas 