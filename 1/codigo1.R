# Primeiro, vamos ler os dados do arquivo RenewEnergConsumption.xls
# Para isso, precisamos instalar e carregar a biblioteca "readxl"
install.packages("readxl")
library(readxl)

# A função file.choose abre uma janela de seleção de arquivos
arquivo <- file.choose()

# Agora, podemos ler o arquivo com o comando read_excel
dados <- read_excel(arquivo)

# Vamos selecionar apenas as colunas "Country Name", "Year" e "Renewable energy consumption (% of total final energy consumption)"
dados <- dados[, c("Country Name", "Year", "Renewable energy consumption (% of total final energy consumption)")]

# Agora, vamos selecionar apenas os dados dos países Mali e Nauru
dados <- dados[dados$CountryName %in% c("Mali", "Nauru"), ]

# Finalmente, vamos criar o gráfico de dispersão com os dados selecionados
library(ggplot2)
ggplot(data = dados, aes(x = Year, y = `Renewable energy consumption (% of total final energy consumption)`, color = CountryName)) +
  geom_point() +
  labs(x = "Ano", y = "Consumo de energias renováveis (% do consumo total de energia)", color = "País")

