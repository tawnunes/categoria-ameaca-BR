# Algoritmo para verificação e confirmação do status de ameaça 
# a nível nacional da fauna e flora brasileira
# 
# MBA em Data Science & Analytics - USP
# 
# Autora: Tawane Yara Nunes
# E-mail: taw.ynunes@gmail.com

# FUNÇÃO DE CONSULTA A LISTA DA PORTARIA 148 DE 7 DE JUNHO DE 2022
# CONFERIR STATUS DE AMEAÇA

statusICMBio <- function(lista){
 lista_ameacadas <- read.csv("./dados/processados/lista_fauna.csv")
 
 nova_lista <- lista %>% left_join(lista_ameacadas, by = "especie") %>% 
                         select(c(especie, categoria)) %>% 
                         mutate(referencia = "Portaria MMA 148 de Julho de 2022")
 
 
 #write.csv(nova_lista, "status_ICMBio.csv", 
 #          row.names = FALSE)
 write_excel_csv2(nova_lista, "status_ICMBio.csv")
 
 print("A lista conferida encontra-se no seu diretorio")
}
