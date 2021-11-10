# Hierarchical Regression (Multiple Regression & Mixed Effect Models) ----------


reg_data = data.frame(
  Scores = c(rnorm(50, 10, 2), 
             rnorm(50, 15, 2), 
             rnorm(50, 12, 2), 
             rnorm(50, 8, 2)),
  Factor1 = sort(rep(c(-1, 1), 100)),
  Factor2 = rep(sort(rep(c(-1, 1), 50)), 2),
  Subject = 1:50
)

simple_model = lm(Scores ~ Factor1 + Factor2, data=reg_data)
anova(simple_model)
summary(simple_model)

complex_model = lm(Scores ~ Factor1*Factor2, data=reg_data)
anova(complex_model)
summary(complex_model)


anova(simple_model, complex_model)



library(lme4)
library(lmerTest)

simple_lme = lmer(Scores ~ Factor1 + Factor2 + (1|Subject), data=reg_data)
anova(simple_lme)

complex_lme = lmer(Scores ~ Factor1*Factor2 + (1|Subject), data=reg_data)
anova(complex_lme)

anova(simple_lme, complex_lme)



