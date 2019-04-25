setwd("/Users/shutingchen/Desktop/ISE533")
#install.packages("softImpute")
#install.packages("Matrix")
install.packages("scales")
library(scales)
?scales
library(Matrix)
library(softImpute)
require(softImpute)
x <- read.csv('recipes_users_ratings.csv')
fits=softImpute(x,trace=TRUE,type="svd")
y = complete(x,fits)
#mins = min(y)
#maxs = max(y)

#y0 = scale(y, center = mins, scale = maxs - mins)

y0 = scale(y,center = TRUE, scale = TRUE)
#fn <- function(y0) y0 * 5/max(y0, na.rm = TRUE)
#y1 <- data.frame(lapply(y0, fn))


y1 = rescale(y0, to = c(0,5))
write.csv(y1, file = "recipe-user-rating-after-matrix-completion.csv")

d0 = read.csv('recipe-user-rating-after-matrix-completion.csv')
d0 = d0[,-1]
d0 = d0[1,]
d1 = round(d0,2)
write.csv(d1, file = "personal-rating-after-matrix-completion.csv")


summary(d0)
head(d0)


