# Section on expressions


library(rlang)

expr(mean(x, na.rm = TRUE))

expr(10 + 100 + 1000)




capture_it <- function(x) {
  expr(x)
}

capture_it(a + b + c)

capture_it <- function(x) {
  enexpr(x)
}

capture_it(a + b + c)


f <- expr(f(x = 1, y = 2))

# Add a new argument
f$z <- 3

f

# Or remove an argument
f[[2]] <- NULL

f

# Note: The first element of the call is the function to be called,
# which means the first argument is in the second position.


lobstr::ast(f(a, "b"))


lobstr::ast(f1(f2(a, b), f3(1, f4(2))))


lobstr::ast(1 + 2 * 3)



call2("f", 1,2,3)

call2("+", 1, call2("*", 2, 3))




xx <- expr(x + x)
yy <- expr(y + y)

expr(!!xx / !!yy)



cv <- function(var) {
  var <- enexpr(var)
  expr(sd(!!var) / mean(!!var))
}

cv(x)

cv(x + y)

cv(cv(x) + cv(y))


cv(`)`)


# Section 17.5

eval(expr(x + y), env(x = 1, y = 10))


eval(
  expr = expr(x + y),
  envir = env(x = 2, y = 100)
)


x <- 10
y <- 100
eval(expr(x + y))

# 17.6
string_math <- function(x) {
  e <- env(
    caller_env(),
    `+` = function(x, y) paste0(x, y),
    `*` = function(x, y) strrep(x, y)
  )
  
  eval(enexpr(x), e)
}

name <- "Hadley"
string_math("Hello " + name)

string_math(("x" * 2 + "-y") * 3)


# Section 17.7

df <- data.frame(x = 1:5, y = sample(5))
eval_tidy(expr(x + y), df)

