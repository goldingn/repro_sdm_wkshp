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

# You can get validation statistics via the PerformanceMeasures module:
ModuleHelp(PerformanceMeasures)

# even on a simple model, without performing any cross-validation,
# we can return the statistics...

work1 <- workflow(occurrence = UKAnophelesPlumbeus,
              covariate = UKAir,
              process = OneHundredBackground,
              model = LogisticRegression,
              output = PerformanceMeasures)

# ... however the module will issue a warning telling you that it isn't
# a great idea

# ~~~~~~~~~~~~
# (standard) k-fold cross-validation

# a better idea is k-fold cross-validation; splitting the data into k
# subsets and fitting k models, each time holding back the k^th subset for
# evaluation.

# zoon handles crossvalidation automatically, provided a process module adds
# a 'fold' column to the data telling it which fold is which.
# The Crossvalidate process module handles this for k-fold cross validation.

ModuleHelp(Crossvalidate)

# Try varying number of folds and look at predictive performance each time
work2 <- workflow(occurrence = UKAnophelesPlumbeus,
                  covariate = UKAir,
                  process = c(OneHundredBackground,
                              Crossvalidate(k = 3)),
                  model = LogisticRegression,
                  output = PerformanceMeasures)


# ~~~~~~~~~~~~
# spatially stratified cross-validation

# For SDM, splitting the training and test sets up into geographically distinct
# regions is often a good idea. The PartitionDisc process module will do this,
# along with an optional buffer to reduce environmental correlations further.

ModuleHelp(PartitionDisc)

# vary number of folds and look at predictive performance each time
work3 <- workflow(occurrence = UKAnophelesPlumbeus,
                  covariate = UKAir,
                  process = c(OneHundredBackground,
                              PartitionDisc),
                  model = LogisticRegression,
                  output = PerformanceMeasures)


# ~~~~~~~~~~~~~