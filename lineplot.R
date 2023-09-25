library(readxl)
library(tidyverse)
library(tidypaleo)
library (ggthemes)
Dados_pataa <- read_excel("~/Docs facul/Mestrado/Dados Lagoa da Pata/arquivos para graficos/xrf1.xlsx")
(scipen = 999)

Dados_pataa$Param = factor(Dados_pataa$Param, levels = c('Sr','Ti', 'Pb','Nb'))
patalake2 <- ggplot(Dados_pataa, aes(y = Age, x = Value, group = 1, col = Param))+
  geom_hline(yintercept = c(6500, 3600, 1100), alpha = 0.7, lty=2)+
  scale_colour_manual(values = c( 'skyblue4', 'steelblue', 'deepskyblue4','blue', 'chartreuse4'))+
  geom_path(size = 1) + geom_point(shape = 21, size =1)+
  facet_wrap(~Param, scales = "free_x", ncol = 5) +
  facet_geochem_gridh(vars(Param))+
  scale_y_reverse(breaks=seq(0, 8000, by = 1000))+
  theme(strip.text.x = element_text(size= 20),
        strip.background = element_line(colour="black")) +
  labs(title = "", x = "Values", y = "Age (Years B.P)") +
  theme_clean()+
  theme(strip.text = element_text(size= 25, face = "bold"), #parameters
        strip.background = element_rect(colour="white"),
        axis.text.x = element_text(angle = 90, vjust = 0.5, size =20),# Medidas do eixo x-desvio 
        axis.title.x = element_text(size =25), #titulo do eixo x
        axis.text.y.left = element_text(size = 20), 
        axis.text.y.right = element_text(size = 20), # medidas eixo y - depth e age
        axis.title.y = element_text(size = 25), # titulo eixo y
        title = element_text(size = 25, face = "bold"), 
        panel.grid.major.y = element_blank(), panel.grid.minor.y = element_blank(), 
        panel.border = element_blank(), axis.line.x = element_line(colour = "black"), axis.line.y.left = element_line(colour = "black"),
        legend.position = "none",
        panel.background = element_blank())


patalake2


graph <- patalake2 

ggsave(filename="xrfb.png", 
       plot = graph,
       width = 14, height = 7,
       dpi = 500)
