# Practical exercises for session 4 - model validation

# The aim of this practical is to play with different ways of validating models
# and see how they affect the different metrics and models. We'll cover
# in-sample versus out-of-sample validation, k-fold validation and spatially-
# stratified cross-validation.

# clear workspace and load zoon
rm(list = ls())
library(zoon)

# ~~~~~~~~~~~~
# In-sample validation statistics

ModuleHelp(PerformanceMeasures)

work1 <- workflow(occurrence = UKAnophelesPlumbeus,
              covariate = UKAir,
              process = OneHundredBackground,
              model = LogisticRegression,
              output = PerformanceMeasures)

# ~~~~~~~~~~~~
# (standard) k-fold cross-validation

ModuleHelp(Crossvalidate)

# vary number of folds and look at predictive performance each time
work2 <- workflow(occurrence = UKAnophelesPlumbeus,
                  covariate = UKAir,
                  process = c(OneHundredBackground,
                              Crossvalidate(k = 3)),
                  model = LogisticRegression,
                  output = PerformanceMeasures)


# ~~~~~~~~~~~~
# spatially stratified cross-validation

ModuleHelp(PartitionDisc)

# vary number of folds and look at predictive performance each time
work3 <- workflow(occurrence = UKAnophelesPlumbeus,
                  covariate = UKAir,
                  process = c(OneHundredBackground,
                              PartitionDisc),
                  model = LogisticRegression,
                  output = PerformanceMeasures)

