# outliers_-_matrizes.github.io
Este é um projeto para identificação de 'outliers' e para o cálculo de matrizes de correlação e de covariância usando o R. 

# Identificação algébrica e gráfica de outliers 6 sigma

Foram utilizados dados de vazão volumétrica de uma planta química industrial para a realização deste projeto. Para a identificação algébrica dos outliers, foi utilizado o software R. Também foi utilizado Excel para construção do gráfico com todas as variáveis (X1 a X5) e visualização dos outliers.

Comando do R para identificação algébrica dos outliers:  

![image](https://user-images.githubusercontent.com/81119854/124470216-b99c4000-dd71-11eb-8bed-e4a559c3d4be.png)

Abaixo, um screenshot do 'Console' do Rstudio com os valores de outliers identificados:

![image](https://user-images.githubusercontent.com/81119854/124470672-4a731b80-dd72-11eb-93d6-dc83ef8e181a.png)

Os valores exibidos como outliers, considerando o método de 6σ (seis sigma), foram de 2984 L/min (X2) e 2795 L/min (X3) - conforme imagem acima. A visualização dos outliers pode ser observada no gráfico abaixo, que relaciona a vazão das 5 variáveis com o tempo.

![image](https://user-images.githubusercontent.com/81119854/124470968-ad64b280-dd72-11eb-8b28-d193c6a609f4.png)

# Identificação e limpeza de outliers Mahalanobis 

Apesar da limpeza de outliers do tipo 6 sigma, ainda podem existir outliers do tipo Mahalanobis (distância estatística). Por isso, foi feita a identificação e limpeza desse tipo de outliers, conforme screenshot abaixo.

![image](https://user-images.githubusercontent.com/81119854/124472182-303a3d00-dd74-11eb-9e44-fbcfd22d0f2f.png)

# Cálculo das matrizes de correlação e de covariância

Abaixo, o screenshot com os comandos para o cálculo das matrizes de correlação e de covariância:

![image](https://user-images.githubusercontent.com/81119854/124472725-d7b76f80-dd74-11eb-92e6-d7de4489b342.png)

Abaixo, o resultado:

![image](https://user-images.githubusercontent.com/81119854/124472759-e1d96e00-dd74-11eb-83cc-673b63cd6247.png)

# Correlação entre as variáveis

Para entender e visualizar a correlação das variáveis entre si, foi plotado o gráfico abaixo:

![image](https://user-images.githubusercontent.com/81119854/124473310-878cdd00-dd75-11eb-8c39-0cc2b1d2966a.png)

![image](https://user-images.githubusercontent.com/81119854/124473262-793ec100-dd75-11eb-953a-ed755717088b.png)

A correlação se dá por meio dos eixos das abcissas e das ordenadas. Quanto maior a correlação entre duas variáveis, mais presente se torna a diagonal de 45° no quadrado formado pelo gráfico. Do contrário, a correlação é menor e, portanto, os pontos ficam muito dispersos.  
