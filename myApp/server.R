library(shiny)
shinyServer(function(input,output){

  means <- reactive({
    rolls <- replicate(input$numeric, sample(1:6, 5, replace = T))
    colMeans(rolls)
  })
  
  output$plot1 <- renderPlot({
    h <- hist(means(), main = '', xlab = 'Mean')
    
    if(input$showNorm){
      xlist <- seq(min(means()), max(means()), length = 40)
      ylist <- dnorm(xlist, mean = mean(means()), sd = sd(means()))
      ylist <- ylist * diff(h$mids[1:2]) * length(means())
      lines(xlist, ylist, col = "blue", lwd = 3)
    }
  })
})