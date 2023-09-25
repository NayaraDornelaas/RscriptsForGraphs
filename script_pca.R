library(ggfortify)
library(readxl)

dados <- read_excel("C:/Users/Nayara/Downloads/pca.xlsx")

df <- dados[2:9]
pca <- princomp(df , cor = TRUE)

pca_pata <- autoplot(pca, data = dados, colour = 'Zone', loadings = T, loadings.colour = 'black', loadings.label = T,
         loadings.label.size = 5, loadings.label.colour = 'black',  frame=TRUE,
         frame.type='norm', frame.level=.7) +
  scale_color_brewer(palette="Dark2") +
  scale_fill_brewer(palette="Dark2") +
  theme_minimal()

pca_pata

ggsave(filename="PCA2.png", 
       plot = pca_pata,
       width= 11, height = 8,
       dpi = 500)