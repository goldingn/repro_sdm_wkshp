# Practical exercises for session 1 - fitting an SDM

# The aim of this practical is to carry out some very simple SDM analyses in
# zoon workflows, look at common model outputs  and to get familiar with
# switching between different module types

# clear workspace
rm(list = ls())

# load zoon
library(zoon)

# ~~~~~~~~~~
# using zoon

# The main zoon function is workflow, which combines modules for each of the
# key SDM components into a singe SDM workflow, and carries it out.
# You can read the helpfile here:
?workflow

# There are five different module types, to obtain or load occurrence data,
# obtain or load covariate data, apply some processing steps to these data,
# fit a statistical model to them, and produce some sort of output from this
# model

# Here's a simple zoon workflow we're going to perform:
# work1 <- workflow(occurrence = CWBZimbabwe,
#                   covariate = Bioclim(extent = c(28, 38, -25, -15),
#                                       res = 2.5),
#                   process = NoProcess,
#                   model = LogisticRegression,
#                   output = InteractiveMap)

# To find out about each of these modules we're using, you can use ModuleHelp:

ModuleHelp(CWBZimbabwe)
# this occurrence module obtains presence-absence dataset of the coffee
# white stem borer in Zimbabwe, from an open-access publication

ModuleHelp(Bioclim)
# This covariate module obtains the bioclim covariate layers from the web.
# We specify a geographic extent to get only a small area,
# corresponding to the occurrence data, rather than the whole world.
# We also specify a higher resolution than the default.

ModuleHelp(NoProcess)
# We don't want to apply any processes to these data, so just use this
# placeholder module

ModuleHelp(LogisticRegression)
# This model fits a simple logistic regression to predict probability of
# presence

ModuleHelp(InteractiveMap)
# This module produces an interactive html map of the model predictions

# So let's carry out the analysis
work1 <- workflow(occurrence = CWBZimbabwe,
                  covariate = Bioclim(extent = c(28, 38, -25, -15),
                                      res = 2.5),
                  process = NoProcess,
                  model = LogisticRegression,
                  output = InteractiveMap)

# The only thing we see at the moment is the interactive map output
# (as well as some warnings from R telling us this was a bad model)

# To get a list of the available modules, you can use GetModuleList
GetModuleList()

# ~~~~~~~~~~
# Different model outputs

# Here are some different output modules you can use instead of InteractiveMap:
# (remember you can use GetModuleList to find all the available modules)

ModuleHelp(SurfaceMap)
ModuleHelp(SameTimePlaceMap)
ModuleHelp(PredictNewAreaMap)
ModuleHelp(PrintMap)
ModuleHelp(ResponseCurve)
ModuleHelp(PerformanceMeasures)

# Try switching the output module to some of these
# (note that some require additional arguments)

work2 <- workflow(occurrence = CWBZimbabwe,
                  covariate = Bioclim(extent = c(28, 38, -25, -15),
                                      res = 2.5),
                  process = NoProcess,
                  model = LogisticRegression,
                  output = )  # <- stick something in here


# ~~~~~~~~~~
# Listing module types

# Rather than fit the model again each time we want to get a different output,
# we can instead combine them in a list:

work2 <- workflow(occurrence = CWBZimbabwe,
                  covariate = Bioclim(extent = c(28, 38, -25, -15),
                                      res = 2.5),
                  process = NoProcess,
                  model = LogisticRegression,
                  output = list(SameTimePlaceMap,
                                InteractiveMap,
                                ResponseCurve(cov = 1),
                                ResponseCurve(cov = 2)))


# We can use lists with other module types too:
work2 <- workflow(occurrence = CWBZimbabwe,
                  covariate = Bioclim(extent = c(28, 38, -25, -15),
                                      res = 2.5),
                  process = NoProcess,
                  model = list(LogisticRegression,
                               RandomForest),
                  output = InteractiveMap)

# This will fit both models and produce outputs for each one
# You may need to scroll back through the maps if you're in RStudio

# note though that we can currently only have one list in a workflow,
# otherwise the number of combinations of operations to perfrom would
# grow very rapidly!

# ~~~~~~~~~~
# Chaining module types

# what if you only want one analysis, but want to do different things
# for each module type *sequentially*?

# the Chain command does this, so that you can concatenate occurrence
# datasets and string  processes together.

# For example:

# TO DO
