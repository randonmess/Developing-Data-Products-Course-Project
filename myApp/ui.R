library(shiny)
shinyUI(fluidPage(
  titlePanel("Central Limit Theorem Demonstration"),
  sidebarLayout(
    sidebarPanel(
      numericInput("numeric", "How many observations?",
                   value = 1000, step = 100),
      checkboxInput("showNorm", "Show/Hide Normal Distribution")
    ),
    mainPanel(
            h3("Histogram of Mean of Five Dice Rolls"),
            tabsetPanel(type = 'tabs',
                        tabPanel("Histogram", br(), plotOutput("plot1")),
                        tabPanel("Documentation", br(),
                                 p("This is a demonstration of Central Limit Theorem. The user types the number of observations of five dice rolls in the numeric input box. A histogram is plotted of the means of each observation. As the number of observations increases, the histogram should increasingly resemble a normal distribution. A normal distribution curve of the data can be overlaid by selecting the checkbox."))
            )
    )
  )
))