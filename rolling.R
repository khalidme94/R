roll = function(die,probability){
  
  dice= sample(die, size = 7, replace = TRUE,prob = probability)
  (dice)
  
  
  }


die1=1:10
probability1=c(1/10,1/10,1/10,1/10,1/10,1/10,1/10,1/10,1/10,1/10)

die2=1:20
probability2= c(1/20,1/20,1/20,1/20,1/20,1/20,1/20,1/20,1/20,1/20,
                1/20,1/20,1/20,1/20,1/20,1/20,1/20,1/20,1/20,1/20)



dice1
dice2

summation= function(dice){
  sum(dice)
}

sum_dice1=summation(dice1)
sum_dice2=summation(dice2)



sum_dice1
sum_dice2



check= function(dice,limit){
  result = 0
  for (num in dice) {
    if (num > limit) {
      result= result+1
      }
  }
   result
  
}

check(dice1,7)
check(dice2,17)