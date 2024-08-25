# Primeiro, vamos ler os dados do arquivo hicp.xlsx
# Para isso, precisamos instalar e carregar a biblioteca "readxl"
install.packages("readxl")
library(readxl)

# A função file.choose abre uma janela de seleção de arquivos
arquivo <- file.choose()

# Agora, podemos ler o arquivo com o comando read_excel
dados <- read_excel(arquivo)

# Vamos selecionar apenas as colunas "Category", "Year", "Month" e "Value"
dados <- dados[, c("Category", "Year", "Month", "Value")]

# Agora, vamos selecionar apenas os dados das categorias All-items HICP, Yoghurt e Poultry
dados <- dados[dados$Category %in% c("All-items HICP", "Yoghurt", "Poultry"), ]

# Vamos criar uma nova coluna com a data completa (ano e mês)
dados$Date <- paste(dados$Year, dados$Month, sep = "-")

# Finalmente, vamos criar o gráfico com os dados selecionados
library(ggplot2)
ggplot(data = dados, aes(x = Date, y = Value, color = Category)) +
  geom_line() +
  labs(x = "Data", y = "Preço", color = "Categoria")
