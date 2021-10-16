library(readxl)
teste <- read_excel("R/teste.xlsx")
View(teste)

### Matriz de correlação

M.cor <- cor(teste[2:6])
M.cor

# Recebe os valores da matriz covariância da coluna 2 até a coluna 6
# Não funcionou o comando "end" para definir 

### Matriz de covariância

M.cov <- cov(teste[2:6])
M.cov

### Scatter plot (Gráfico de dispersão)

plot(teste[2:6])
