# fixar a semente
set.seed(1674)

# definir os parâmetros da distribuição de Cauchy
xzero <- -1.1
gamma <- 5.7

# criar uma lista com as dimensões das amostras
dimensoes <- seq(3000, 10000, by=500)

# gerar as amostras e calcular as médias e medianas
medias <- numeric(length(dimensoes))
medianas <- numeric(length(dimensoes))

for(i in 1:length(dimensoes)){
  amostra <- rcauchy(dimensoes[i], xzero, gamma)
  medias[i] <- mean(amostra)
  medianas[i] <- median(amostra)
}

# instalar e importar o pacote ggplot2
install.packages("ggplot2")
library(ggplot2)

# criar o gráfico
ggplot() + 
  geom_line(aes(x=dimensoes, y=medias), color="red", size=1) +
  geom_line(aes(x=dimensoes, y=medianas), color="blue", size=1) +
  ggtitle("Média e mediana das amostras em função da dimensão") +
  xlab("Dimensão da amostra") +
  ylab("Valor da média/mediana") +
  scale_color_manual(values = c("red" = "red", "blue" = "blue"),
                     name = "Estimadores") +
  theme_classic()