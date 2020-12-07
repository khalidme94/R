# Import Data Frame
deck <- read.csv('https://github.com/gumdropsteve/datasets/raw/master/deck.csv')

# Function to shufle the deck of cards
shuffling_deck<- function (df){
  Shuffle <- df[sample(1:nrow(df)),]
  Shuffle
}

deck=shuffling_deck(deck)
deck

# create two data frame for each game
blackjack = deck
hearts =deck

#Q2, Custom function for Heart
hearts = deck[deck$suit == 'hearts', ]


hearts[1:4,]


player1 = c(hearts[1,]) 
rbind(player1,c(hearts[3,]))

player2 =c(hearts[2,]) 
rbind(player2,c(hearts[4,]))

#Q3, Custom function for Blackjack


blackjack[1:6,]

player1 = c(blackjack[1,]) 
rbind(player1,c(blackjack[3,]))

player2 =c(blackjack[2,]) 
rbind(player2,c(blackjack[4,]))

player3 =c(blackjack[5,]) 
rbind(player3,c(blackjack[6,]))
