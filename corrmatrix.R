#criar matriz de correla��o b�sica com visualiza��o no pr�prio R
matriz <- cor(mcorr_densidade)
View(matriz)

#pacote para criar uma matriz com visualiza��o gr�fica mais bonita
install.packages("corrplot")
library(corrplot)

corrplot(matriz) #padr�o com circulos
corrplot(matriz, method="color") #method muda o modo de visualiza�ao do gr�fico, color s�o apenas quadrados preenchids com as cores
corrplot(matriz, method="ellipse") #mostra em elipses
corrplot(matriz, method="shade") # mostra em tons
corrplot(matriz, method="number") #mostra por n�meros e cores, � o melhor

#posi��o do gr�fico
corrplot(matriz,type="upper", method="number") #mostra a metade de cima
pata1 <- corrplot(matriz,type="lower", method="number") #mostra a metade de baixo
pata1
#matriz de correla��o e matriz de valor p
install.packages("Hmisc")
library(Hmisc)
m <- rcorr(as.matrix(mcorr_xrf_Z1))
m

m$r #matriz de coeficiente de correla��o
m$P #matriz de valor p
m$n #numero de observa��es

#grafico mais complexo
pata <- corrplot(m$r, p.mat=m$P, sig.level=0.05, method="number", type="lower")
pata
graph <-pata1
ggsave("corr_xrf_Z1.png")
