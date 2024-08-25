#Verifica se os pacotes "stringr" e "ggplot2" estão instalados e importa-os
if (!require("stringr")) {
  install.packages("stringr")
  library("stringr")
}

if (!require("ggplot2")) {
  install.packages("ggplot2")
  library("ggplot2")
}

#Pede ao usuário para selecionar o arquivo CSV
file_path <- file.choose()

#Lê os dados do arquivo CSV usando o separador "," e especificando que a primeira linha contém os cabeçalhos
data <- read.csv(file_path, header = TRUE)

#Seleciona os dados dos países selecionados
countries <- data[data$País %in% c("México", "Dinamarca", "Irlanda") & data$Sexo == "Total",]

#Substitui as strings específicas na coluna "Ocupação"
countries$Ocupação <- str_replace_all(countries$Ocupação, c("Trabalho não remunerado" = "Trabalho\nnão remunerado",
                                                            "Cuidata_ex3 pessoais" = "Cuidata_ex3\npessoais",
                                                            "Trabalho remunerado ou estudo" = "Trabalho remunerado\nou estudo"))

#Converte os valores Tempo para numérico
countries$Tempo <- as.numeric(countries$Tempo)

#Cria o gráfico de barras usando os dados selecionados e especificando as colunas de interesse para os eixos x, y e cor
ggplot(countries, aes(x = Ocupação, y = Tempo, fill = País)) +
  geom_bar(position = "dodge", stat = "identity") +
  scale_y_continuous(breaks = seq(0, 700, by = 50)) +
  theme(plot.title = element_text(hjust = 0.5))+
  facet_wrap(~Sexo)+
  labs(title = "Tempo médio diário despendido por pessoas entre os 15 e os 64 anos em diferentes ocupações",
       x = "Tipo de ocupação",
       y = "Tempo diário (minutos)",
       fill = "País")


