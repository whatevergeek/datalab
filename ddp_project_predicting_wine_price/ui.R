library(shiny)
shinyUI(fluidPage(
  titlePanel("Predict Wine Price from Factors"),
  h4("Documentation: This simple data visualization shows the effect of Temperature and Age to the predicted Wine Price."),
  h4("Try to tweak the Temperature and Age factors below and see the predicted wine price on the right."),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderAGST", "What is the average growing season temperature (AGST)?", 10, 20, value = 17, step = 0.01),
      sliderInput("sliderAge", "What is the age of wine?", 1, 40, value = 20, step = 0.1),
      submitButton("Submit")
    ),
    mainPanel(
      h3("Predicted Price from Model 1 (AGST only):"),
      textOutput("pred1"),
      plotOutput("plot1"),
      h3("Predicted Price from Model 2 (Age only):"),
      textOutput("pred2"),
      plotOutput("plot2"),
      h3("Predicted Price from Model 3 (Both AGST and Age):"),
      textOutput("pred3")
    )
  )
))