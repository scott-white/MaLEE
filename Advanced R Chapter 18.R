library(rlang)
library(lobstr)


# Section 18.1

z <- expr(y <- x * 10)
z


x <- 4

eval(z)

y



# Section 18.3.2 Symbols

expr(x)

sym("x")



x <- 1:10

call2(median, x, na.rm = TRUE)
call2(expr(median), x, na.rm = TRUE)
call2(median, expr(x), na.rm = TRUE)
call2(expr(median), expr(x), na.rm = TRUE)




f1 <- function(x, y) {
  exprs(x = x, y = y)
}
f2 <- function(x, y) {
  enexprs(x = x, y = y)
}
f1(a + b, c + d)
f2(a + b, c + d)
