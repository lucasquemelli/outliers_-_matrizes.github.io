library(readxl)
teste <- read_excel("R/teste.xlsx")
View(teste)

### Matriz de correla��o

M.cor <- cor(teste[2:6])
M.cor

# Recebe os valores da matriz covari�ncia da coluna 2 at� a coluna 6
# N�o funcionou o comando "end" para definir 

### Matriz de covari�ncia

M.cov <- cov(teste[2:6])
M.cov

### Scatter plot (Gr�fico de dispers�o)

plot(teste[2:6])
