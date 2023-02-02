# Algoritmo para verificação e confirmação do status de ameaça 
# a nível nacional da fauna e flora brasileira
# 
# MBA em Data Science & Analytics - USP
# 
# Autora: Tawane Yara Nunes
# E-mail: taw.ynunes@gmail.com

# Consulta na tabela

# PACOTES----------------------------------------------------------------
library(tidyverse)


# IMPORTANDO DADOS ------------------------------------------------------

especies_conferir <- read.csv2("./dados/teste/FaunaAtropelada.csv")


# TESTE DA FUNÇÃO ---------------------------------------------------------------

source("./funcoes/statusAmeacaBR.R")

statusAmeacaBR("./dados/teste/FaunaAtropelada.csv")


