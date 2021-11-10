# Linear Mixed Effect Model (Single Factor) ------------------------------------

reg_data = data.frame(
  Scores = c(rnorm(50, 200, 20), rnorm(50, 300, 20)),
  Condition = c(rep(-1, 50), rep(1, 50)),
  Subject = 1:50
)

reg_data[,2] = as.factor(reg_data[,2])
reg_data[,3] = as.factor(reg_data[,3])

library(lme4)
library(lmerTest)

reg_results = lmer(Scores ~ Condition + (1|Subject), data=reg_data)
anova(reg_results)

summary(reg_results)
