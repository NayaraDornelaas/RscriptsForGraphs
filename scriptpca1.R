install.packages("readr")
library(FactoMineR); library(factoextra); library(corrplot); library(ggplot2);
library(tidyverse);
#Plot PCA básico

PCA(df, scale.unit = TRUE, ncp = 5, graph = TRUE)

df<- PCA(df, graph = FALSE)
head(df)
print(df)

#Obter eigenvalues

eig.val_foram <- get_eigenvalue(df)
head(eig.val_foram)


#PLOT eignvalues of PCA

eig_foram <- fviz_eig(df, addlabels = TRUE)
eig_foram

ggsave(filename="variance_foram.png", 
       plot = eig_foram,
       dpi = 300)

var_foram <- get_pca_var(df)
var_foram
ind_foram <- get_pca_ind(df)
ind_foram
head(var_foram$contrib, 6)

#cos2: represents the quality of representation for variables on the factor map.
#It's calculated as the squared coordinates: var.cos2 = var.cood*var.coord

fviz_pca_var(df, col.var = "black")
head(var_foram$cor)
corrplot(var_foram$cos2, is.corr = FALSE)
corrplot(var_foram$coord, is.corr = FALSE)
corrplot(var_foram$contrib, is.corr = FALSE)

fviz_cos2(df, choice = "var", axes = 1:2)

#Plot contribution

cluster_CONTRIBUTION_foram <- fviz_pca_var(df, col.var = "cos2", gradient.cols = c("#00AFBB", "#E7B800", "#FCE407"),
                                           repel = TRUE) + theme_clean()

cluster_CONTRIBUTION_foram



corrplot(var_foram$cor, is.corr = FALSE)

ggsave(filename="contribution_brejo.png", 
       plot = cluster_CONTRIBUTION_foram,
       dpi = 500)


set.seed(123)
res.km2 <- kmeans(var_foram$contrib, centers = 3, nstart = 25)
head(res.km2)
grp2 <- as.factor(res.km2$cluster)
grp2

#contrib: contains the contributions (in percentage) of the variables to the principal components.
#The contribution of a variable (var) to a given principal component is (in percentage) : 
#(var.cos2 * 100) / (total cos2 of the component).

#Plot cluster PCA

cluster_PCA_foram <- fviz_pca_biplot(geom.ind = "point", df, col.var = grp2, palette = c("#868686FF", "#EFC000FF","#0073C2FF"),
                                  legend.title = "Cluster", repel = TRUE, frame = T,  frame.type='norm', frame.level=.7) + theme(plot.title = element_blank(), 
                                                                                  panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                                                                                  panel.border = element_blank(), axis.line.x = element_line(colour = "black"), axis.line.y.left = element_line(colour = "black"),
                                                                                  axis.line.y.right = element_line(color = "black"))
cluster_PCA_foram

ggsave(filename="PCA_p.png", 
       plot = cluster_PCA_foram,
       dpi = 500)

?fviz_pca_var