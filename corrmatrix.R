#criar matriz de correlação básica com visualização no próprio R
matriz <- cor(mcorr_densidade)
View(matriz)

#pacote para criar uma matriz com visualização gráfica mais bonita
install.packages("corrplot")
library(corrplot)

corrplot(matriz) #padrão com circulos
corrplot(matriz, method="color") #method muda o modo de visualizaçao do gráfico, color são apenas quadrados preenchids com as cores
corrplot(matriz, method="ellipse") #mostra em elipses
corrplot(matriz, method="shade") # mostra em tons
corrplot(matriz, method="number") #mostra por números e cores, é o melhor

#posição do gráfico
corrplot(matriz,type="upper", method="number") #mostra a metade de cima
pata1 <- corrplot(matriz,type="lower", method="number") #mostra a metade de baixo
pata1
#matriz de correlação e matriz de valor p
install.packages("Hmisc")
library(Hmisc)
m <- rcorr(as.matrix(mcorr_xrf_Z1))
m

m$r #matriz de coeficiente de correlação
m$P #matriz de valor p
m$n #numero de observações

#grafico mais complexo
pata <- corrplot(m$r, p.mat=m$P, sig.level=0.05, method="number", type="lower")
pata
graph <-pata1
ggsave("corr_xrf_Z1.png")
