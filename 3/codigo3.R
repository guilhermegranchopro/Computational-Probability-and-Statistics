# Primeiro, vamos ler os dados do arquivo TIME_USE_24092022.csv
# Para isso, precisamos instalar e carregar a biblioteca "readr"
install.packages("readr")
library(readr)

# A função file.choose abre uma janela de seleção de arquivos
arquivo <- file.choose()

# Agora, podemos ler o arquivo com o comando read_csv
dados <- read_csv(arquivo)

# Vamos selecionar apenas as colunas "Country", "Sex", "Activity", e "Average daily time (minutes per day)"
dados <- dados[, c("Country", "Sex", "Activity", "Average daily time (minutes per day)")]

# Agora, vamos selecionar apenas os dados dos países México, Espanha e Turquia
dados <- dados[dados$Country %in% c("Mexico", "Spain", "Turkey"), ]

# Finalmente, vamos criar o gráfico de barras com os dados selecionados
library(ggplot2)
ggplot(data = dados, aes(x = Activity, y = `Average daily time (minutes per day)`, fill = Sex)) +
  geom_col(position = "dodge") +
  labs(x = "Ocupação", y = "Tempo médio diário (minutos por dia)", fill = "Sexo") +
  facet_wrap(~Country, ncol = 1)
