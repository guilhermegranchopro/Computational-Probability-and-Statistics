# Primeiro, vamos fixar a semente para que os resultados da simulação sejam reproduzíveis
set.seed(1528)

# Agora, vamos criar uma função que simula uma única repetição do jogo
jogo <- function() {
  # Lançamos o dado
  resultado <- sample(1:6, size = 1)
  
  # Verificamos o resultado e retornamos o ganho correspondente
  if (resultado %in% c(3, 2)) {
    return(-30)
  } else if (resultado == 1) {
    return(30)
  } else if (resultado == 5) {
    return(8*30)
  } else {
    return(0)
  }
}

# Agora, vamos simular 7968 repetições do jogo e armazenar os resultados em uma lista
ganhos <- replicate(7968, jogo())

# Finalmente, vamos calcular a média dos ganhos e arredondá-la para duas casas decimais
media <- round(mean(ganhos), 2)

# Imprimimos o resultado
print(media)
