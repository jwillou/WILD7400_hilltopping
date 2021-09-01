setwd("/Users/jannawilloughby/GDrive/ABMs/WILD7400_hilltopping/")
directory = getwd()
outdir    = paste(directory,"/output/", sep="")
source(paste(directory, "/source/FunctionSourcer.R", sep =''))

#parameters
elevation = c(0, 400)           #peak elevation min and max
landscape = 150                 #number of patches on each side, total patch number = landscape*landscape

nindvs    = 50                  #number of individuals to simulate
nsteps    = 500                 #number of steps an individual can take
move      = 0.8                 #decimal likelihood of individual moving to highest neighbor patch (R&G call this q)

#initialize landscape
land = LandscapeInit(elevation)
image(land)

#initialize individuals on landscape
pop = NewPop(nindvs, landscape)
pop = rbind(pop,NewPop(nindvs, landscape))
points(pop[,1]/150, pop[,2]/150, pch=19, cex=0.5)
plot(-100,-100, xlim=c(0,150), ylim=c(0,150))
points(pop[,1], pop[,2], pch=19, cex=0.5)

#allow individuals to move within landscape


#extract needed output from simulation

