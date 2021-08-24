setwd("/Users/jannawilloughby/GDrive/ABMs/WILD7400_hilltopping/")
directory = getwd()
outdir    = paste(directory,"/output/", sep="")
source(paste(directory, "/source/FunctionSourcer.R", sep =''))

#parameters
elevation = c(0, 400)           #peak elevation min and max
landscape = 150                 #number of patches on each side, total patch number = landscape*landscape

nindvs    = 500                 #number of individuals to simulate
nsteps    = 1000                #number of steps an individual can take
move      = 0.8                 #decimal likelihood of individual moving to highest neighbor patch (R&G call this q)

#initialize landscape
land = LandscapeInit(elevation)
#image(land)

#initialize individuals on landscape

#allow individuals to move within landscape

#extract needed output from simulation

