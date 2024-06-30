library(rlang)
library(lobstr)


# Section 18.1

z <- expr(y <- x * 10)
z


x <- 4

eval(z)

y
