rm("list"=ls())

n = 317
sample <- c(82,57,53,38,47,40)
probs_0 <- c(0.24, 0.20, 0.16, 0.14, 0.13, 0.13)

expected = c()
for (p in probs_0) {
  expected <- c(expected, n*p)
}

q = 0
for (i in seq_len(length(sample))) {
  q = q + ((sample[i] - expected[i])^2)/expected[i]
}

p_value = round(1 - pchisq(q, df = length(sample)-1, lower.tail = TRUE), 4)

# o p-value é de 0.7038