# SDM stacking example in zoon

library(zoon)

# stack two mosquito species
stack_work <- workflow(occurrence = list(SpOcc(species = 'Anopheles plumbeus',
                                               extent = c(-11, 2.5, 49.5, 61)),
                                         SpOcc(species = 'Culex pipiens',
                                               extent = c(-11, 2.5, 49.5, 61))),
                       covariate = Bioclim(extent = c(-11, 2.5, 49.5, 61),
                                           res = 5),
                       process = OneHundredBackground,
                       model = GBM,
                       output = SameTimePlaceMap)

# look at the workflow object
str(stack_work, 1)
str(stack_work$report, 1)

# combine the rasters into a RasterStack
stack <- stack(stack_work$report)
# sum the predictions
richness <- calc(stack, sum)
# plot your species richness map
plot(richness)
