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
 
 lista <- read.csv2(lista)
 
 lista_ameacadas <- read.csv("./dados/processados/lista_especies_ameacadas.csv")
 
 lista_ameacadas <- lista_ameacadas %>% select(c(especie, categoria)) %>% 
                                        rename(status_portaria148 = categoria)
 
 nova_lista <- lista %>% left_join(lista_ameacadas, by = "especie")
 
 
 write_excel_csv2(nova_lista, "resultado_status_ameaca.csv")
 
 print("A lista conferida encontra-se no seu diretorio")
}
