# Potential Questions to Answer:
# 1. Create snacks that the customers can buy and randomize who buys which snack
# 2. Pretend you own multiple theaters and run two simulations to represent each theater and plot the results
# 3. Create conditional statements for movies that may be PG-13 and children are not allowed to watch

# Cost for adults and children
ticket_cost <- 100 
  ticket_cost_child <- 50 
    movies <- c('Moana', 'Hangover', 'Swordsman', 'Titanik', 'Friend')  # List 5 of your favorite movies
    screens <-3  # How many screens does the theater have? (assume 1 per movie)
      seats <- 100 # How many seats does each theater hold
      week_days <- rep(0, 7)  # Store totals for each day
#      tot_rev_screen = rep(0,3) #Store totals for each screen
      
      
    # iterate through the week
    for (d in 1:7) {
      
      # Keep track of total revenue for the day
      total_day_revenue = 0
      
      # iterate through the amount of screens on a particular day
      for (s in 1:screens) {
        
        # Calculate  how many adults and children are watching the movie
        visitors_adults <- sample(seats, 1)
        visitors_children <- sample((seats - visitors_adults),1)
        
        # Calculate the revenue for adults and children
        revenue_adult = visitors_adults * ticket_cost 
        revenue_children= visitors_children * ticket_cost_child

        # Calculate revenue, and add to running total for the day
        total_screen_revenue= revenue_adult + revenue_children
         
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
    max(week_days)