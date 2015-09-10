# Practical exercises for session 3 - accounting for observation bias

# The aim of this practical is to play with different ways of accounting
# for observation bias in presence-only SDMs and look at the effects of
# not accounting for it. We'll look at incorporating a 'bias grid' approach
# and the 'reference set background' approach.

# clear workspace
rm(list = ls())


library(zoon)
work1 <- workflow(occurrence = UKAnophelesPlumbeus,
                  covariate  = Bioclim(extent = c(-11, 2.5, 49.5, 61),
                                       res = 2.5),
                  process    = BiasBackground(bias = FrescaloBias,
                                              n = 500),
                  model      = GBM,
                  output     = InteractiveMap)
