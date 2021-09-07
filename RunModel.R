setwd("/Users/jannawilloughby/GDrive/ABMs/WILD7400_hilltopping/")
directory = getwd()
outdir    = paste(directory,"/output/", sep="")
source(paste(directory, "/source/FunctionSourcer.R", sep =''))

#parameters
elevation.V = c(0, 400)           #peak elevation min and max
landscape.V = 150                 #number of patches on each side, total patch number = landscape*landscape
nindvs.V    = 50                  #number of individuals to simulate
nsteps.V    = 500                 #number of steps an individual can take
move.V      = c(0.3,0.8)          #decimal likelihood of individual moving to highest neighbor patch (R&G call this q)
reps        = 10                 #number of replicates to run each model

parameters = expand.grid(elevation.V,landscape.V,nindvs.V,nsteps.V,move.V)
colnames(parameters) = c("elevation","landscape","nindvs","nsteps","move")
parameters = parameters[parameters$elevation!=0,]

for(p in 1:nrow(parameters)){
  elevation = c(0, parameters$elevation[p])
  landscape = parameters$landscape[p]
  nindvs    = parameters$nindvs[p]
  nsteps    = parameters$nsteps[p]
  move      = parameters$move[p]
  
  for(r in 1:reps){
    #initialize landscape
    land = LandscapeInit(elevation, landscape)
    image(land)
    
    #initialize individuals on landscape
    pop = NewPop(nindvs, landscape)
    points(pop[,1]/150, pop[,2]/150, pch=19, cex=0.5)
    #plot(-100,-100, xlim=c(0,150), ylim=c(0,150))
    #points(pop[,1], pop[,2], pch=19, cex=0.5)
    
    #allow individuals to move within landscape
    pathways = NULL
    for(i in 1:nrow(pop)){
      #isolate individual of interest
      indv = pop[i,,drop=FALSE]
      
      #chart movement
      movepath = MoveIndv(indv, land, move, nsteps, elevation, landscape)
      
      #plot movement
      lines(movepath[seq(1,length(movepath), 2)]/150, movepath[seq(2,length(movepath), 2)]/150, lwd=2)
      
      #record path in single object for all individuals
      pathways = rbind(pathways, movepath)
    }
    rownames(pathways) = seq(1,nindvs,1)
    
    #extract needed output from simulation
    #for this project it is fine to NOT do any stats, but you will want to export something (maybe a figure) so you and
    #everyone can see how your model worked. we will use this to talk about approaches that worked well/did not work great.
    
  } 
}



