LandscapeInit = function(elevation){
  #set up object
  land  = matrix(nrow=landscape, ncol=landscape)
  xpeak = sample(1:landscape, 1)
  ypeak = sample(1:landscape, 1)
  land[xpeak, ypeak] = elevation[2]
  
  #set peak row/column values
  land[xpeak, 1:(ypeak-1)] = round(seq(elevation[1], elevation[2], (elevation[2]-elevation[1])/(ypeak-2)) + rnorm((ypeak-1),0,1), 0)
  land[xpeak, (ypeak+1):landscape] = round(rev(seq(elevation[1], elevation[2], (elevation[2]-elevation[1])/(landscape-ypeak-1)) + rnorm((landscape-ypeak),5,2)), 0)
  
  #work from edges and fill in elevation
  for(r in (xpeak-1):1){
    land[r,] = land[(r+1),] - round(rnorm(landscape, 5, 1), 0)
  }
  for(r in (xpeak+1):landscape){
    land[r,] = land[(r-1),] - round(rnorm(landscape, 5, 1), 0)
  }
  return(land)
}