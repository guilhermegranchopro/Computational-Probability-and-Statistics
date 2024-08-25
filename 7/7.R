# fixar a semente
set.seed(376)

# definir os parâmetros
mu <- 4
sigma <- 4.3
n <- 46
m <- 1503

# gerar as amostras
amostras <- matrix(rnorm(n*m, mean=mu, sd=sigma), ncol=n)

# calcular os estimadores para cada amostra
estimador1 <- rowMeans(amostras)
estimador2 <- apply(amostras, 1, median)
estimador3 <- (apply(amostras, 1, min) + apply(amostras, 1, max))/2

# calcular as médias das estimativas
media1 <- mean(estimador1)
media2 <- mean(estimador2)
media3 <- mean(estimador3)

# calcular as diferenças absolutas entre as médias e o valor teórico
dif1 <- abs(media1 - mu)
dif2 <- abs(media2 - mu)
dif3 <- abs(media3 - mu)

# calcular o menor desses valores absolutos
menor_dif <- min(c(dif1, dif2, dif3))

# arredondar o menor valor para 6 casas decimais
menor_dif_arredondado <- round(menor_dif, 6)

# imprimir o valor final
menor_dif_arredondado