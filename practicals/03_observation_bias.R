# Practical exercises for session 3 - accounting for observation bias

# The aim of this practical is to play with different ways of accounting
# for observation bias in presence-only SDMs and look at the effects of
# not accounting for it. We'll look at incorporating a 'bias grid' approach
# and the 'reference set background' approach.

# clear workspace and load zoon
rm(list = ls())
library(zoon)

# ~~~~~~~~~~~~~~
# Here's a presence-only distribution model for a common species

work1 <- workflow(occurrence = SpOcc(species = 'Columba palumbus',
                                     extent = c(-11, 2.5, 49.5, 61),
                                     limit = 500),
                  covariate  = Bioclim(extent = c(-11, 2.5, 49.5, 61),
                                       res = 5),
                  process    = Background(n = 1000),
                  model      = GBM,
                  output     = InteractiveMap)

# Does the prediction / presence data seem biased to you?

# ~~~~~~~~~~~~~~
# An handy way of accounting for observation bias in presence-only data is to
# mimic it in the background data. One way of doing that is to bias sampling
# according to a raster representing bias.

# zoon has an in built-dataset of plant reporting bias in England, created from
# a Frescalo analysis (ask Tom of Nick Isaac for details). We can use this in
# conjunction with the BiasBackground process module which uses a raster to bias
# background sampling

# first we grab that bias grid
# (you could also load one with the raster function) :
bias <- FrescaloBias

# then we fit a model, biasing sampling by this
work2 <- workflow(occurrence = SpOcc(species = 'Columba palumbus',
                                     extent = c(-11, 2.5, 49.5, 61),
                                     limit = 500),
                  covariate  = Bioclim(extent = c(-11, 2.5, 49.5, 61),
                                       res = 5),
                  process    = BiasBackground(bias = bias,
                                              n = 1000),
                  model      = GBM,
                  output     = InteractiveMap)


# did that make the model more realistic?

# often it's hard to find a raster that represents the 'true' observation bias

# ~~~~~~~~~~~~~~~
# An alternative is the target group background of Phillips et al.
# this uses occurrence of another group of species as background points
# for the species we're modelling.

# We can Chain together presence and background occurrence data using SpOcc
# to sample the distribution of a related, and common species

work2 <- workflow(occurrence = Chain(SpOcc(species = 'Columba palumbus',
                                           extent = c(-11, 2.5, 49.5, 61),
                                           limit = 500),
                                     SpOcc(species = 'Columba livia',
                                           extent = c(-11, 2.5, 49.5, 61),
                                           limit = 500,
                                           type = 'background')),
                  covariate  = Bioclim(extent = c(-11, 2.5, 49.5, 61),
                                       res = 5),
                  process    = NoProcess,
                  model      = GBM,
                  output     = InteractiveMap)

# ~~~~~~~~~~~~~~~
# there's no 'correct' answer to how to deal with observation bias
# why not have a play with these methods for a species of interest?






# ...




