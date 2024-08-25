#Verifica se os pacotes "readxl" e "ggplot2" estão instalados e importa-os
if (!require("readxl")) {
  install.packages("readxl")
  library("readxl")
}

if (!require("ggplot2")) {
  install.packages("ggplot2")
  library("ggplot2")
}

#A função file.choose abre uma janela de seleção de arquivos
arquivo <- file.choose()

#Lê o arquivo com o comando read_excel
dados <- read_excel(arquivo, skip=3)

#Seleciona os anos
dados_anos <- (1990:2019)

#Seleciona os dados apenas dos nomes dos países selecionados
dados_numeros_1 <- t(dados[dados$`Country Name` == "Antigua and Barbuda", 35:64])

dados_numeros_2 <- t(dados[dados$`Country Name` == "Mauritania", 35:64])

#Cria o data frame para dados selecionados
dados_1 <- data.frame(anos=dados_anos, numeros=dados_numeros_1, nome="Antigua and Barbuda")

dados_2 <- data.frame(anos=dados_anos, numeros=dados_numeros_2, nome="Mauritania")

#Junta os data frames
dados_finais <- rbind(dados_1, dados_2)

#Cria o gráfico de dispersão com os dados selecionados
ggplot(dados_finais, aes(x = anos, y = numeros, color = nome)) +
  geom_point() +
  labs(x = "Ano", y = "Consumo de energias renováveis (% do consumo total de energia)", color = "País") + ggtitle("Consumo de energias renováveis")
