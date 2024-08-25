# Primeiro, vamos ler os dados do arquivo TIME_USE_24092022.csv
# Para isso, precisamos instalar e carregar a biblioteca "readr"
library(readr)

# A função file.choose abre uma janela de seleção de arquivos
arquivo <- file.choose()

# Agora, podemos ler o arquivo com o comando read_csv
dados <- read.csv(arquivo, stringsAsFactors = FALSE)

# Vamos selecionar apenas as colunas "Country", "Sex", "Activity", e "Average daily time (minutes per day)"
dados_México <- dados[c(43, 136, 229, 321, 414), "Tempo"]

dados_Espanha <- dados[c(61, 154, 247, 339, 432), "Tempo"]

dados_Turquia <- dados[c(67, 160, 253, 345, 438), "Tempo"]

dados_ocupações <- dados[c(43, 136, 229, 321, 414), "Ocupação"]

dados_México <- data.frame(ocupações=dados_ocupações, numeros=dados_México, pais="México")

dados_Espanha <- data.frame(ocupações=dados_ocupações, numeros=dados_Espanha, pais="Espanha")

dados_Turquia <- data.frame(ocupações=dados_ocupações, numeros=dados_Turquia, pais="Turquia")

dados_finais <- rbind(dados_México, dados_Espanha, dados_Turquia)

# Finalmente, vamos criar o gráfico de barras com os dados selecionados
library(ggplot2)
ggplot(dados_finais, aes(x = ocupações, y = numeros, fill = pais)) +
  geom_bar(stat="identity",position = "dodge") +
  labs(x = "Ocupação", y = "Tempo médio diário (minutos por dia)", fill = "País")