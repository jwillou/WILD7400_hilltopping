#common issues in all of the hilltopping code I looked at

####1. don't give it away if you don't follow my GitHub advice...####
setwd("~/Desktop/model")  #/model doesn't match repo name
setwd("/Users/jannawilloughby/GDrive/ABMs/WILD7400_hilltopping/") #WILD7400_hilltopping does match repo name


####2. commenting code is SUPER important, especially as we move forward####

#option 1
variance = 25 
pop = matrix(nrow=nindvs, ncol=2)
x = sample(1:(landscape-variance), 1)
y = sample(1:(landscape-variance), 1)
pop[,1]  = x + rpois(nindvs, variance)
pop[,2]  = y + rpois(nindvs, variance)


#option 2
#how far apart should individuals be, at max?
variance = 25 #values is in cells

#initialize pop object
pop = matrix(nrow=nindvs, ncol=2)

#choose rough starting coordinates
x = sample(1:(landscape-variance), 1)
y = sample(1:(landscape-variance), 1)

#set starting locations with set variance from x,y selected above
pop[,1]  = x + rpois(nindvs, variance)
pop[,2]  = y + rpois(nindvs, variance)

####3. keep in mind where you area headed####
#scaling up your parameter combos/replicates requires neat/nested layout

#level 1 - page that sets working directory, sources functions, manages replicates, and manages parameter values
#level 2 - RunModel.R that is the backbone of your simulation, calls all the other functions
#level 3 - all your subroutines/functions like Reproduction.R, Move.R, NewPop.R, etc.
#example: https://github.com/jwillou/WILD7400_hilltopping

####4. printing in final code####
#GREAT idea for debugging, not great for scaling up

pop = CreatePop(nindv)
pop #if you print this for every parameter combo and every replicate, your standard out file will be BANANAS
####5. how to debug####
#generally, run line by line
#set loop values to 1, then 2, then 3...
#deal with errors 1 by 1
#you should be testing as you write!

#broken code
i = rnorm(10, 0, 1)
y = 0
for(i in 1:10){
  y = y + log(i[,i])
}

#more complexly broken code:
#https://github.com/jwillou/WILD7400_hilltopping