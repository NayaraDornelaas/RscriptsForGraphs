library(ggplot2)
install.packages("hrbrthemes")
library(hrbrthemes)
sc <- ggplot(scattermo, aes(x=d13C, y=TOC, color=Zone)) +
  geom_point(size=5) +
  labs(x=" ??13C (???)", y="TOC (%)") +
  scale_color_manual(values=c("#6699cc", "#336699", "#003399", "#003366")) +
  theme_ipsum_rc() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background=element_blank(), axis.line=element_line(colour="black"))
sc
graph <- sc

ggsave(filename="scatterMO.png", 
       plot = graph,
       width = 8, height = 7,
       dpi = 500)
