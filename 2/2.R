# Primeiro, vamos ler os dados do arquivo hicp.xlsx
# Para isso, precisamos instalar e carregar a biblioteca "readxl"
install.packages("readxl")
library(readxl)
library(ggplot2)

# A função file.choose abre uma janela de seleção de arquivos
arquivo <- file.choose()

# Agora, podemos ler o arquivo com o comando read_excel
dados <-read_excel(arquivo, sheet=3)

colnames(dados) <- c("MONTH","CATEGORY","VALUE")

# selecionar as categorias de interesse
dados_selecionados <- dados[dados$CATEGORY %in% c("All-items HICP", "Yoghurt", "Poultry"),]

# criar gráfico de linha
ggplot(data=dados_selecionados, aes(x=MONTH, y=VALUE, color=CATEGORY)) +
  geom_line() +
  ggtitle("Alterações nos preços ao consumidor nos 27 países de União Europeia") +
  xlab("Mês") +
  ylab("Preço") +
  scale_x_date(date_labels = "%b %Y",date_breaks = "1 month") +
  theme_classic()