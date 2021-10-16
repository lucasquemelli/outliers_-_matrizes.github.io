tempo <- seq(2,60,by=2)
x1 <- c(1880,1490,1734,1797,1845,1246,1354,1765,1683,1682,1265,1352,1206,1788,1888,1844,1585,1265,1731,1337,1440,1298,1786,
1769,1379,1638,1445,1563,1735,1682)
x2 <- c(1886,2400,2122,1648,1980,1707,1941,2103,2984,1749,1712,2049,1836,1871,1856,1953,1324,1418,1830,1726,2278,1899,1634,2061,1856,1724,2171,1654,2329,1491)
x3 <- c(1648,2045,1703,1630,1920,1707,1683,1819,2795,1604,1593,1910,1837,1689,1646,2148,1169,1370,1636,1595,2191,1614,1514,1867,1493,1409,1899,1674,2304,1383)
x4 <- c(1558,2084,1818,1113,1618,1434,1269,1716,2413,1388,1520,1630,1591,1497,1386,1179,1001,1251,1604,1314,1549,1422,1291,1646,1356,1235,1704,1413,2068,1215)
x5 <- c(1775,2194,2225,1536,1887,1541,1669,1873,2582,1512,1669,1901,1737,1682,1711,1280,1175,1307,1757,1647,2113,1477,1517,2037,1533,1466,1837,1596,2237,1285)

#Coloquei todos em um mesmo vetor
xtodos <- c(1886,2400,2122,1648,1980,1707,1941,2103,2984,1749,1712,2049,1836,1871,1856,1953,1324,1418,1830,1726,2278,1899,1634,2061,1856,1724,2171,1654,2329,1491,1648,2045,1703,1630,1920,1707,1683,1819,2795,1604,1593,1910,1837,1689,1646,2148,1169,1370,1636,1595,2191,1614,1514,1867,1493,1409,1899,1674,2304,1383,1880,1490,1734,1797,1845,1246,1354,1765,1683,1682,1265,1352,1206,1788,1888,1844,1585,1265,1731,1337,1440,1298,1786,1769,1379,1638,1445,1563,1735,1682,1558,2084,1818,1113,1618,1434,1269,1716,2413,1388,1520,1630,1591,1497,1386,1179,1001,1251,1604,1314,1549,1422,1291,1646,1356,1235,1704,1413,2068,1215,1775,2194,2225,1536,1887,1541,1669,1873,2582,1512,1669,1901,1737,1682,1711,1280,1175,1307,1757,1647,2113,1477,1517,2037,1533,1466,1837,1596,2237,1285)


#Fiz a média e a coloquei em número inteiro e fiz o desvio padrão 
mean(xtodos)
as.integer((mean(xtodos)))
sd(xtodos)


#Fiz o desvio postivo em número inteiro
desvio_positivo <- mean(xtodos) + 3*sd(xtodos)
as.integer(desvio_positivo)
desvio_positivo <- as.integer(desvio_positivo)

#Fiz o desvio negativo em número inteiro
desvio_negativo <- mean(xtodos) - 3*sd(xtodos)
as.integer(desvio_negativo)
desvio_negativo <- as.integer(desvio_negativo)


#Pedi para exibir valores acima do limite positivo
xtodos[xtodos > desvio_positivo]


#Pedi para exibir valores abaixo o limite negativo
xtodos[xtodos < desvio_negativo]


library(readxl)
teste <- read_excel("R/teste.xlsx")
View(teste)


# distância estatístia (Mahalanobis)

teste <- teste[,-c(1)]

x <- teste
y <- as.data.frame(mahalanobis(x, colMeans(x), cov(x)))
names(y)[1] = "Distancias"
y$Index = c(1:nrow(y))


alpha = 0.05
df <- ncol(x[,])
limite <- qchisq(1-alpha,df = df)
is_mv_outlier <- ifelse(y$Distancias > limite, "SIM", "NÃO")
x$Outliers <- is_mv_outlier
x = x[x$Outliers == "NÃO",]

x
summary(x)

x[6] = NULL

teste <- x

#Introdução da matriz

library(readxl)
teste <- read_excel("R/teste.xlsx")
View(teste)

class(teste$x2)
length(teste$x2)
summary(teste$x2)
summary(teste)

medias <- mean(teste[,2:6])


# Boxplot de todos os dados

b <- boxplot(teste[2:6],ylab="vazão (L/min)")

## Histograma da variável x2

hist(teste$x2,freq=F,xlim = c(1000,3000),ylim = c(0,0.002),main = "Histograma da vazão x2",xlab = "Vazão (L/min)", ylab = "densidade")
x <- seq(from=1000,to=3000,by=100)
dens <- dnorm(x,mean = mean(teste$x2),sd=sd(teste$x2))
lines(x,dens,col=3,lwd=1)
abline(v=mean(teste$x2),lty=2)

# Se tirar "freq" e "ylim" aparece a frequência absoluta 
# "col" é o número da cor e "lwd" é a largura da linha
# "lty" muda o tipo de traço
# "lines" é a curva da normal
# "abline" é o traço vertical no centro do gráfico

## Correlação multivariada

c <- plot(teste[2:6])

## Definir os intervalos de confiança

n <- length(teste$x2)
alpha <- 0.05
prob <- 1-alpha/2
t <- qt(p=prob,df= n-1)
t
sda <- sd(teste$x2)

error.t <- t*sda/sqrt(n)
error.t

LB.t <- mean(teste$x2) - error.t
UB.t <- mean(teste$x2) + error.t
c(LB.t,UB.t)

LI.t <- mean(teste$x2)-t*sda
LS.t <- mean(teste$x2)+t*sda

plot(teste$tempo,teste$x2,ylim = c(1000,3000),main="Gráfico de controle: x2 = média +- t.s", xlab = "tempo (h)",ylab = "vazão (m³/h)")

abline(h=mean(teste$x2),col=2,lwd=3)
abline(h=LI.t,col=2,lty=2)
abline(h=LS.t,col=2,lty=2)

