# Potential Questions to Answer:
# 1. Create snacks that the customers can buy and randomize who buys which snack


# Cost for adults and children
ticket_cost <- 100 
  ticket_cost_child <- 50 
    movies <- c('Moana', 'Hangover', 'Swordsman', 'Titanik', 'Friend')  # List 5 of your favorite movies
    screens <-3  # How many screens does the theater have? (assume 1 per movie)
      seats <- 10 # How many seats does each theater hold
      week_days <- rep(0, 7)  # Store totals for each day

      
      #Snack Data Frame
      snack=data.frame (snack_type=c('popcorn','chocolate','candy','redboll'),
                        price=c(5 ,3 ,2 ,6),
                        child_permission= c('yes','yes','yes','no') )
      snack
      
      
    # iterate through the week
    for (d in 1:7) { 
      
      # Keep track of total revenue for the day
      total_day_revenue = 0
      
      # iterate through the amount of screens on a particular day
      for (s in 1:screens) {
        
        # Calculate  how many adults and children are watching the movie
        visitors_adults <- sample(seats, 1)
        visitors_children <- sample((seats - visitors_adults),1)
        
        total_reserved_seats = visitors_adults + visitors_children
        
        # Create function to data frame of confirmed visitors
        dataframe_visitors = function(input1,input2){
          visitor_adult = data.frame(seat_num= c(1:input1),category=c(rep(('Adult'),input1)))
          visitor_child = if (input2>0){
            data.frame(seat_num= c(1:input2),category=c(rep(('Child'),input2))) # cause a lot of errors
          }
          else{
            data.frame(seat_num=c(),category=c())
          }
          
          visitor_data= rbind(visitor_adult,visitor_child)
          visitor_data
        }
        
        visistors_information= dataframe_visitors(visitors_adults,visitors_children)
    
        
         # create code that addresses visitors who are willing to buy a snack
         
         willing_to_purchase_visitor = visistors_information[sample(visistors_information$seat_num,
                                              sample(visistors_information$seat_num,
                                                     1:length(visistors_information$seat_num))),]
         willing_to_purchase_visitor
         
        
         
         # create a pre list to record all purchased visitors and what they purchased and how much the price
         list_of_purchase = data.frame(seat_num= c(),category=c(),purchased_snack=c(),price=c())
         
         for (c in willing_to_purchase_visitor$seat_num){
           list_purchase= data.frame(seat_num= c(c),category= c(willing_to_purchase_visitor$category[willing_to_purchase_visitor$seat_num==c]),purchased_snack =c(
             
             if(isTRUE(willing_to_purchase_visitor$category[willing_to_purchase_visitor$seat_num==c]=='Child')){
               
               selected_snack= sample(snack$snack_type[snack$child_permission=='yes'],1)
               selected_snack
             }
             else{
               selected_snack= sample(snack$snack_type,1)
               selected_snack
               
             }
           )
           
           )
           # issue in price need to be fixed
           price=c(snack$price[snack$snack_type==list_purchase$purchased_snack])
           list_purchase=data.frame(c(list_purchase),c(price))
           list_of_purchase=rbind(list_of_purchase,list_purchase)
         }
       
         print(paste0('Customers who are  willing to purchase a snack in day:',d,' , and screen:',s)) 
         print(list_of_purchase)   
         list_of_purchase
        
        # Data frame of customer who are not willing to purchase a snack
         non_purchase = data.frame(c(visistors_information[!(visistors_information$seat_num %in% willing_to_purchase_visitor$seat_num),]), purchased_snack= rep(c('NONE'),length(visistors_information$seat_num[!(visistors_information$seat_num %in% willing_to_purchase_visitor$seat_num)])),c.price.=rep(c(0),length(visistors_information$seat_num[!(visistors_information$seat_num %in% willing_to_purchase_visitor$seat_num)])))
         non_purchase
         print(paste0('Customers who are not willing to purchase a snack in day:',d,' , and screen:',s))
         print(non_purchase)
         
        # Data frame of all customers with their snack information (wither the customer buy a snack or not)
         all_reserved_customer_info = rbind(list_of_purchase,non_purchase)
         all_reserved_customer_info
         #print(all_reserved_customer_info) # we preferred to comment this line as it shows huge amount of output
        
        # Calculate the snack revenue for adults and children
         snack_adult_revenue = sum(list_of_purchase$c.price.[list_of_purchase$category=='Adult'])
         snack_child_revenue = sum(list_of_purchase$c.price.[list_of_purchase$category=='Child'])
        
        # Calculate the ticket revenue for adults and children
        revenue_adult = visitors_adults * ticket_cost 
        revenue_children= visitors_children * ticket_cost_child
        

        # Calculate revenue, and add to running total for the day
        total_screen_revenue= revenue_adult + revenue_children + snack_adult_revenue + snack_child_revenue
         
      }
      # Save total to the corresponding day
      
       total_day_revenue[d] = total_day_revenue  + total_screen_revenue
       week_days[d]=total_day_revenue[d]
 
    }
    week_days
    # Make a barchart showing total revenue per day
  x= 1:7 # Assign x axis 
  ds = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat")
  barplot(week_days, names.arg = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat")) # we tried to show the x axis
    
    # Make any other chart
    plot(week_days)
    # Which day had the highest revenue?
    print('The highest day in revenue is:')
    highestDay=which.max(week_days)
    highestDay
    
    print('With revenue of:')
    max(week_days)
    
    
   
    