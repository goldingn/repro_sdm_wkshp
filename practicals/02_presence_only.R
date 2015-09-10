# Practical exercises for session 2 - presence-absence versus presence-only SDMs

# The aim of this practical is to experiment with different types of
# presence-only SDM model and how they differ to presence/absence SDMs.
# We'll compare the 'naive' presence-only model with Maxent,
# play around with generating background points and explore different sources
# of presence-absence data 

# clear workspace
rm(list = ls())

# load zoon
library(zoon)

# The first step in modelling presence-only data is to get hold of some.
# The AnophelesPlumbeus occurrence module returns occurrence data for the mosquito species
# in the UK - we often use it as a test module

ModuleHelp(AnophelesPlumbeus)

# The UKBioclim covariate module grabs bioclim variables at 5km resolution
# for the same area

ModuleHelp(UKBioclim)

# Next (at least for the probabilisitc models currently in the lost of zoon
# modules), you'll need some sort of background data to fit a model
# We can start with 100 random locations wherever the chosen covariate is defined.

ModuleHelp(OneHundredBackground)

# Here's a simple workflow for a 'naive' logistic regression model using these
# data:

work5 <- workflow(occurrence = AnophelesPlumbeus,
                  covariate = UKBioclim,
                  process = OneHundredBackground,
                  model = LogisticRegression,
                  output = InteractiveMap)

# ~~~~~~~~~~
# More interesting occurrence data

# The SpOcc module (which wraps around the SpOcc R package) allows you to
# grab species occurrence (i.e. presence-only) data from databases like GBIF

ModuleHelp(SpOcc)

# To use SpOcc, you need to provide a species (Latin) name and a geographic
# extent to search. You can also change the database (GBIF by default)
# and tell zoon it's something other than presence data (more on that in the
# observation bias session).

# Here's a global map of a more interesting species...

work6 <- workflow(occurrence = SpOcc(species = 'Ailuropoda melanoleuca',
                                     extent = c(-180, 180, -90, 90)),
                  covariate = Bioclim(extent = c(-180, 180, -90, 90),
                                      res = 10),
                  process = OneThousandBackground,
                  model = LogisticRegression,
                  output = InteractiveMap)

# ~~~~~~~~~~~~~~
# runnning MaxEnt models

# MaxEnt deals with background points a bit differently.
# It's a bit difficult to get running though.

# Follow the instructions here to get it set up:
ModuleHelp(MaxEnt)
# (and then ask for help if/when that doesn't work)

work7 <- workflow(occurrence = SpOcc(species = 'Ailuropoda melanoleuca',
                                     extent = c(-180, 180, -90, 90)),
                  covariate = Bioclim(extent = c(-180, 180, -90, 90),
                                      res = 10),
                  process = OneThousandBackground,
                  model = MaxEnt,
                  output = InteractiveMap)

# not that if that doesn't work, you could also use the BioMod package's
# implementation of MaxEnt - it still requires the jar file but it goes
# in the working directory
# Be warned, the Biomod version fails if there's a space in the path to
# the working directory!

# ~~~~~~~~~~~~~
# Differences between MaxEnt and logistic regression

# The Background process modules lets you select the number of background
# points

ModuleHelp(Background)

# How do MaxEnt and LogisticRegression behave when you raise the number of
# background points?



# have a play here ...







# What happens 