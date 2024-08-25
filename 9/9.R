rm("list"=ls())

set.seed(1375)

sigma2 = 2.4
mu_0 = 0.8
alpha = 0.06
m = 300
n = 32
mu = 1.2


num_rejections = 0
sample_mean = 0
t = 0
q = qnorm(1-alpha, mean = 0, sd = 1)

m = matrix(rnorm(n*m, mean = mu, sd = sqrt(sigma2)), nrow=m)
for (row in seq_len(nrow(m))) {
  sample_mean=0
  for (col in seq_len(ncol(m))) {
    sample_mean = sample_mean + m[row,col]
  }
  sample_mean = sample_mean/n
  t = (sample_mean-mu_0)/(sqrt(sigma2/n))
  if (t > q) {
    num_rejections = num_rejections +1
  }
}
num_rejections

# houve 136 rejeições e 164 não rejeições.
p_not_reject = (m-num_rejections)/m
p_not_reject

#comparar com o valor teorico = 1 - potencia:
pot = 1 - pnorm(q + (mu_0-mu)/sqrt(sigma2/n), mean=0, sd=1)
p_not_reject_teo = 1-pot
p_not_reject_teo

#conclui-se que é uma boa estimativa.