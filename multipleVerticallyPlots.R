install.packages("cowplot")
install.packages("tibble")
install.packages("ggthemes")
library(readxl)
library(tibble)
library(ggpubr)
library(cowplot)
library(tidyverse)
library(grid)
library(tidypaleo)
library (ggthemes)
library(ggplot2)

grafico <- read_excel("Docs facul/Mestrado/Dados Lagoa da Pata/arquivos para graficos/Brutos/vertical.xlsx")
scipen = (999)

Data1 <- grafico %>%
  select("Age", "TOC")
Data1
plot1 <- ggplot(Data1, aes(x = Age, y= TOC)) +
  geom_path(col='aquamarine4', size=1.3) + geom_point(size = 1.5, shape = 21, fill = "aquamarine4", colour="aquamarine4") +
  scale_y_continuous(position = "left") + 
  scale_x_continuous(position = "top", breaks=seq(0, 8000, by = 1000), limits=c(0,8000))+
  theme_classic() + labs(x = "Age (cal yrs BP)", y = "TOC Lagoa da Pata") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.title.y = element_text(size = 14, face = "bold"), axis.title.x = element_text(size = 14, face = "bold"),
        axis.text.y = element_text(size = 14), axis.text.x = element_text(size = 14)) +
  geom_rect(data=Data1, aes(NULL, NULL, xmin = 5400, xmax=8000), ymin=3.8, ymax = 4, alpha=0.01)

plot1


Data2 <- grafico %>%
  select("Age1", "TiC")
Data2

plot2 <- ggplot(Data2, aes(x = Age1, y= TiC)) +
  geom_path(col='skyblue4', size=1.3) + geom_point(size = 1.5, shape = 21, fill = "skyblue4", colour='skyblue4') +
  scale_y_continuous(position = "right") +
  scale_x_continuous(limits = c(0,8000)) +
  theme_classic() + labs( y = "Ti Cariaco Basin") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.title.y = element_text(size = 14, face = "bold"), axis.title.x = element_text(size = 14, face = "bold"),
        axis.text.y = element_text(size = 14), axis.text.x = element_text(size = 14))
plot2

Data3 <- grafico %>%
  select("Age2", "Insolacao")
Data3

plot3 <- ggplot(Data3, aes(x = Age2, y= Insolacao)) +
  geom_path(col='black', size=1.3) + geom_point(size = 1.5, shape = 21, fill = "black") +
  scale_y_continuous(position = "left") +
  scale_x_continuous(limits = c(0,8000)) +
  theme_classic() + labs(x = NULL, y = "Insolacao de dezembro") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.title.y = element_text(size = 14, face = "bold"), axis.title.x = element_text(size = 14, face = "bold"),
        axis.text.y = element_text(size = 14), axis.text.x = element_text(size = 14))
plot3

Data4 <- grafico %>%
  select("Age3", "d13C")
Data4

plot4 <- ggplot(Data4, aes(x = Age3, y= d13C)) +
  geom_path(col='darkorange3', size=1.3) + geom_point(size = 1.5, shape = 21, fill = "darkorange3", colour='darkorange3') +
  scale_y_continuous(position = "right") +
  scale_x_continuous(limits = c(0,8000)) +
  theme_classic() + labs( y = "d13C titicaca", x = "Age (cal yrs BP)") +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.title.y = element_text(size = 14, face = "bold"), axis.title.x = element_text(size = 14, face = "bold"),
        axis.text.y = element_text(size = 14), axis.text.x = element_text(size = 14))
plot4


plotfinal <- plot_grid(plot1 +
                         theme(
                           plot.margin = margin(t = 1, b= 0, l = 1, r = 1)),
                       plot2 +
                         theme(axis.text.x = element_blank(),
                               axis.ticks.x = element_blank(),
                               axis.title.x = element_blank(),
                               axis.line.x = element_blank(),
                               plot.margin = margin(t = 0, b= 0, l = 1, r = 1)),
                       plot3  +
                         theme(axis.text.x = element_blank(),
                               axis.ticks.x = element_blank(),
                               axis.title.x = element_blank(),
                               axis.line.x = element_blank(),
                               plot.margin = margin(t = 0, b= 0, l = 1, r = 1)),
                       plot4 +
                         theme(plot.margin = margin(t = 0, b= 1, l = 1, r = 1) ), 
                       ncol = 1, align = "v") 
    

plotfinal


ggsave(filename="vertical1.png", 
       plot = plotfinal,
       height = 17, width = 9,
       dpi = 500)