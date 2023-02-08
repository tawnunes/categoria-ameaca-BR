# Lista Nacional de Espécies Ameaçadas Sob a Perspectiva da Acessibilidade e 
# Sistematização de Dados
# 
# MBA em Data Science & Analytics - USP
# 
# Autora: Tawane Yara Nunes
# E-mail: taw.ynunes@gmail.com

# Descritivo da lista de espécies ameaçadas Portaria MMA n° 148

# Pacotes -----------------------------------------------------------------

source("./R/00_carregar_pacotes.R")

# IMPORTANDO DADOS ------------------------------------------------------------------

especies_ameacadas <- read.csv("dados/processados/lista_especies_ameacadas_P148.csv")


# DESCRITIVO ------------------------------------------------------------------------

## GERAL -------

geral <- especies_ameacadas %>% 
         group_by(componente) %>% 
         tally() %>% 
         mutate(prop = round(prop.table(n),2)) %>% 
         ungroup()

geral


geral_categoria <- data.frame(table(especies_ameacadas$componente, 
                                    especies_ameacadas$categoria_portaria148))

colnames(geral_categoria) <- c("componente", "categoria", "frequencia")

geral_categoria <- geral_categoria %>% 
  mutate(prop = prop.table(round(frequencia,3)),
         categoria = factor(categoria, levels = c(
          "VU","EN","CR","CR (PEX)", "RE", "EW", "EX")))




## FLORA ------

# espécies 
flora <- especies_ameacadas %>% 
 filter(componente == "Flora") %>% 
 group_by(familia) %>% 
 tally() %>%
 mutate(freq_rel = round((n/sum(n))*100)) %>% 
 arrange(desc(n)) %>% 
 ungroup()

flora %>% filter(n == max(n)) %>% mutate(prop = n/3209)

# categorias 

flora_cat <- especies_ameacadas %>% 
 filter(componente == "Flora") %>% 
 group_by(categoria_portaria148) %>% 
 tally() %>% 
 arrange(desc(n)) %>%
 mutate(freq_rel = round((n/sum(n))*100))
 ungroup()

 flora_cat 

## FAUNA ----

fauna <- especies_ameacadas %>% 
 filter(componente == "Fauna") %>% 
 group_by(grupo) %>% 
 tally()%>% 
 arrange(desc(n)) %>% 
 mutate(freq_rel = round((n/sum(n))*100))

fauna

fauna_cat <- especies_ameacadas %>% 
 filter(componente == "Fauna") %>% 
 group_by(categoria_portaria148) %>% 
 tally() %>% 
 arrange(desc(n)) %>%
 mutate(freq_rel = round((n/sum(n))*100))
ungroup()

fauna_cat
