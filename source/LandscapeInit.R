LandscapeInit = function(elevation, landscape){

  #set up object
  land  = matrix(nrow=landscape, ncol=landscape)
  
  #randomly select landscape peak, but make sure at least 50 cells in from edge
  xpeak = sample(50:(landscape-50), 1)
  ypeak = sample(50:(landscape-50), 1)
  
  #set peak value
  land[xpeak, ypeak] = elevation[2]
  
  #use peak value to fill in elevation left and right of peak in a single row
  #i did this in two steps, 1 for left of peak and 1 for right of peak
  #i also added variance by pulling from a normal distribution and adding that value
  #finally I rounded to zero decimals so that it was easier to deal with when debugging
  land[xpeak, 1:(ypeak-1)] = round(seq(elevation[1], elevation[2], (elevation[2]-elevation[1])/(ypeak-2)) + rnorm((ypeak-1),0,2), 0)
  land[xpeak, (ypeak+1):landscape] = round(rev(seq(elevation[1], elevation[2], (elevation[2]-elevation[1])/(landscape-ypeak-1)) + rnorm((landscape-ypeak),5,2)), 0)
  
  #work from edges and fill in elevation; similar to above but can now do entire columns at one time
  for(r in (xpeak-1):1){
    land[r,] = land[(r+1),] - round(rnorm(landscape, 5, 2), 0)
  }
  for(r in (xpeak+1):landscape){
    land[r,] = land[(r-1),] - round(rnorm(landscape, 5, 2), 0)
  }
  
  #return land object with elevations
  return(land)
}