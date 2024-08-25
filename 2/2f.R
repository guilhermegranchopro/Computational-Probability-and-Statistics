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
dados <-read_excel(arquivo, sheet=3)

#Renomeia as colunas do dataframe
colnames(dados) <- c("MONTH","CATEGORY","VALUE")

#Seleciona as categorias de interesse
dados_selecionados <- dados[dados$CATEGORY %in% c("All-items HICP", "Yoghurt", "Oils and fats"),]

#Cria o gráfico de linha
ggplot(data=dados_selecionados, aes(x=MONTH, y=VALUE, color=CATEGORY, group=CATEGORY)) +
  geom_point() +
  geom_line() +
  ggtitle("Changes in consumer prices in the 27 countries of the European Union") +
  xlab("Date") +
  ylab("HICP (Harmonised Index of Consumer Prices)") +
  theme_classic()