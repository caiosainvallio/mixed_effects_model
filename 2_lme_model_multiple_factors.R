# Linear Mixed Effect Model (Multiple Factors) ---------------------------------

reg_data = data.frame(
  Scores = c(rnorm(50, 100, 20), 
             rnorm(50, 200, 20), 
             rnorm(50, 500, 20), 
             rnorm(50, 250, 20)),
  Factor1 = c(rep(-1, 100), rep(1, 100)),
  Factor2 = rep(c(rep(-1, 50), rep(1, 50)), 2),
  Subject = 1:50
)


reg_data[,2] = as.factor(reg_data[,2])
reg_data[,3] = as.factor(reg_data[,3])
reg_data[,4] = as.factor(reg_data[,4])

library(lme4)
library(lmerTest)

reg_results = lmer(Scores ~ Factor1*Factor2 + (1|Subject), data=reg_data)
anova(reg_results)

reg_results
summary(reg_results)
