# Lista Nacional de Espécies Ameaçadas Sob a Perspectiva da Acessibilidade e 
# Sistematização de Dados
# 
# MBA em Data Science & Analytics - USP
# 
# Autora: Tawane Yara Nunes
# E-mail: taw.ynunes@gmail.com

# Graficos do descritivo da lista de espécies ameaçadas Portaria MMA n° 148

# IMPORTANDO OS DADOS -----------------------------------------------------

source("./R/04_estatistica_descritiva.R")

# DEFININDO TEMA ----------------------------------------------------------

meu_theme <-  theme(panel.background = element_rect(fill = "White"),
                    axis.line = element_line(colour= "black", size = 0.53),
                    legend.text = element_text(size = 9),
                    legend.position = "top",
                    axis.text = element_text(size=9, colour="black"),
                    axis.title.y = element_text(margin = margin(t = 0, r = 10, b = 0, l = 0)),
                    axis.title.x = element_text(margin = margin(t = 10, r = 0, b = 0, l = 0)))

# CATEGORIAS POR COMPONENTE -----------------------------------------------

if (!dir.exists("figs")) dir.create("figs")
png("figs/01_categorias_componente.png",
    width = 15, height = 6, units = "cm", res = 300)

ggplot(geral_categoria, aes(componente, prop*100, fill= categoria))+
 geom_col(#color = "white", 
          width = 0.85)+
 coord_flip()+
 scale_fill_manual(values = c("yellow","orange","red","red3","red4","purple","gray16"),
                   name = "Categoria")+
 labs(x= NULL, y = "Frequência Relativa (%)") +
meu_theme +
 guides(fill = guide_legend(title.position = "top",
                            title.hjust = 0.5,
                            label.position = "bottom",
                            direction = "horizontal",
                            nrow = 1,
                            byrow = T,
                            #keywidth = 1,
                            keyheight = 0.9
                            ))
dev.off()



# flora ----


