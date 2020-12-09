#Starter code
link <- 'https://github.com/gumdropsteve/datasets/raw/master/deck.csv'
deck <- read.csv(link)
deck

#Create number of rounds and players

n_round= 100
n_player= 4



#Create a dataframe to record the result

roundWinnerpoint=rep(0,n_round)
roundwinnername=rep(0,n_round)

#start rounds 

for (r in 1:n_round){
  
  shuffled_deck <- deck[sample(nrow(deck)),] 
  shuffled_deck
  
  cards = shuffled_deck[sample(nrow(shuffled_deck) , 12,  replace= FALSE ),]

  for (p in 1:n_player){
    first_value=(p*3)-2
    last_value=p*3
    
    playercard=cards[first_value:last_value,]
    print(p)
    print(playercard)
    sumvalue=0
    sumvalue= sum(playercard$value)
    print(sumvalue)
    
    if (roundWinnerpoint[r]<sumvalue){
      roundWinnerpoint[r]=sumvalue
      roundwinnername[r]=p

      
      
    }
    
    
  }
  
  
  
  
}
print('Winner Number:')
print(roundwinnername)
print('Winner Points:')
print(roundWinnerpoint)


theWinner=table(roundwinnername)
theWinner






