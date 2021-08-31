NewPop = function(nindvs, landscape){
  #how far apart should individuals be, at max?
  variance = 50 #values is in cells
  
  #initialize pop object
  pop = matrix(nrow=nindvs, ncol=2)
  
  #choose rough starting coordinates
  x = sample(1:(landscape-variance), 1)
  y = sample(1:(landscape-variance), 1)
  
  #set starting locations with set variance from x,y selected above
  pop[,1]  = x + rpois(nindvs, variance)
  pop[,2]  = y + rpois(nindvs, variance)
  
  return(pop)
}