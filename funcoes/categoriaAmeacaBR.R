# Algoritmo para verificação e confirmação do status de ameaça 
# a nível nacional da fauna e flora brasileira
# 
# MBA em Data Science & Analytics - USP
# 
# Autora: Tawane Yara Nunes
# E-mail: taw.ynunes@gmail.com

# FUNÇÃO DE CONSULTA A LISTA DA PORTARIA 148 DE 7 DE JUNHO DE 2022
# CONFERIR STATUS DE AMEAÇA

statusAmeacaBR <- function(lista){
 # carregar pacotes necessários----
 
 # Carregamento de todos os pacotes necessários a execução deste projeto
 
 pacotes <- c("tidyverse") # instala outros pacores do R, principalmente  
 
 if(sum(as.numeric(!pacotes %in% installed.packages())) != 0){
  instalador <- pacotes[!pacotes %in% installed.packages()]
  for(i in 1:length(instalador)) {
   install.packages(instalador, dependencies = T)
   break()}
  sapply(pacotes, require, character = T) 
 } else {
  sapply(pacotes, require, character = T)}
 
 rm(pacotes)
 
 # aplicando a função -----
 
 lista <- read.csv2(lista)
 
 lista_ameacadas <- read.csv("./dados/processados/lista_especies_ameacadas_P148.csv")
 
 lista_ameacadas <- lista_ameacadas %>% select(c(especie, categoria_portaria148))
 
 nova_lista <- lista %>% left_join(lista_ameacadas, by = "especie") %>% 
  mutate(categoria_portaria148 = replace_na(categoria_portaria148, "nao listado")) %>% 
  relocate(categoria_portaria148, .after = especie)
 
 
 write_excel_csv2(nova_lista, "resultado_status_ameaca.csv")
 
 print("Pronto!")
}
