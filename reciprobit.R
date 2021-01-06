# We want to generate a reciprobit plot like it is used in the context of LATER models. 
# Here, we generate normally distributed data. In the reciprobit plot that should appear linear 

rm(list=ls())
library(ggplot2)

N = 1000
f = rnorm(N,mean=300,sd=50)
x = sort(1/f,decreasing=T)
y = (1:N)/N
d = data.frame(x=x,y=y)
l = seq(from=1,to=0.00,by=-0.001)
s = round(1/l)

p = ggplot(d,aes(x=x,y=y)) + 
  geom_point() + 
  geom_line() + 
  scale_x_continuous(trans="reciprocal",breaks=l,labels=s) + 
  scale_y_continuous(trans="probit") 
print(p)
