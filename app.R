

library(shiny)
library(ggplot2)

month_name= c('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec')
month_number=c(1:12)
month_revenue= c(5000,6542,1987,2316,3218,9845,6546,9874,1346,1856,1987,3456)

monthly_revenue= data.frame(month=month_name,month_number=month_number,revenue= month_revenue)



ui = fluidPage(
  textOutput('text0'),
  plotOutput('plot'),selectInput(inputId = 'm',label = 'Select a month please!', choices = month_name, selected = 'Jan'), #month(today(),label = TRUE, abbr = TRUE)
  textOutput('text1'),
  textOutput('text2')
  
  )

server = function(input, output){
  
  output$text0 = renderText({
    
    
    titler= 'Revenue per Month'
    titler
  })
  
  
  output$plot = renderPlot({
   
    
    chart=ggplot(data= monthly_revenue, aes(x=month_number,y= revenue))+xlim(1.0,12.0)+geom_line()+geom_point()
    chart
  })
  
  
    
  output$text1 = renderText({
    
    
    revenueammount = 'The Profit Is:'
    revenueammount
    
  })
  
  output$text2 = renderText({
    
   
    selected_revenue = monthly_revenue$revenue[monthly_revenue$month == input$m]
    selected_revenue
    
  })

   
  


}

shinyApp(ui = ui, server = server)



