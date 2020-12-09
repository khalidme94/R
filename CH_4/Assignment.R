#create dice

dice= 1:10

#Create number of rounds and players

n_round= 100
n_player= 2

#create dataframe to record the round winner

roundWinnerpoint=rep(0,n_round)
roundwinnername=rep(0,n_round)

#start rolling 

for (r in 1:n_round){
  for (p in 1:n_player){
    roll = sample(dice,2, replace = FALSE)
    print(roll)
    sumpoint=0
    sumpoint=sum(roll)
    if (roundWinnerpoint[r]<sumpoint){
      roundWinnerpoint[r]=sumpoint
      roundwinnername[r]=p
        
        
        
      }
 
  
  }
print('New round')
  
  

  
}
print('Winner Number:')
print(roundwinnername)
print('Winner Points:')
print(roundWinnerpoint)


theWinner=table(roundwinnername)
theWinner
