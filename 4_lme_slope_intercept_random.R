# Linear Mixed Effect Model with a Random Intercept and Slope ------------------

reg_data = data.frame(
  Scores = c(rnorm(50, 100, 20), rnorm(50, 150, 20), rnorm(50, 170, 20)),
  Conditions = rep(c(-1, 0, 1), 50),
  Subject = 1:50
)

library(lme4)
library(lmerTest)

# just slope
lme_results = lmer(Scores ~ Conditions + (1|Subject), data=reg_data)
anova(lme_results)
summary(lme_results)

# slope + intercept
lme_results_i = lmer(Scores ~ Conditions + (Conditions|Subject), data=reg_data)
anova(lme_results_i)
summary(lme_results_i)


anova(lme_results, lme_results_i)
