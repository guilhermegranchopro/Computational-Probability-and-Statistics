set.seed(1385)
alpha = 0.08
mu = -6
sigma = 2
n = 14
m = 150


mat <- matrix(rnorm(m*n, mean = mu, sd = sigma), nrow=m)
# m[1,2] (linha 1 coluna 2)

# proporçao de intervalos de confiança gerados que contem mu = -6

# confiança de 0.92
# OMG, eu tava a mater if(sample_mean<-7.0) e ele estava a dar assign brooo, tenho q meter espaços ahahhaa
q = qnorm(1- alpha/2, mean=0, sd=1) #coerente tabela
num_intervals = 0
sample_mean=0
for (row in seq_len(nrow(mat))) {
  sample_mean=0
  for (col in seq_len(ncol(mat))) {
    sample_mean = sample_mean + mat[row,col]
  }
  sample_mean = sample_mean/n
  if (mu >= sample_mean - sigma/sqrt(n)*q && mu <= sample_mean + sigma/sqrt(n)*q) {
    num_intervals = num_intervals + 1
  }
}

prop = round(num_intervals/m,3) # resultado com 3 casas decimais.
print("Valor final pedido: " + prop)