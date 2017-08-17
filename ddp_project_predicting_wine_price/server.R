library(shiny)
wine <- read.csv('wine.csv')

shinyServer(function(input, output) {
    wine_model1 <- lm(Price ~ AGST, data = wine)
    wine_model2 <- lm(Price ~ Age, data = wine)
    wine_model3 <- lm(Price ~ AGST + Age, data = wine)

    model1pred <- reactive({
        agstInput <- input$sliderAGST
        predict(wine_model1, newdata = data.frame(AGST = agstInput))
    })

    model2pred <- reactive({
        ageInput <- input$sliderAge
        predict(wine_model2, newdata = data.frame(Age = ageInput))
    })

    model3pred <- reactive({
        agstInput <- input$sliderAGST
        ageInput <- input$sliderAge
        predict(wine_model3, newdata = data.frame(AGST = agstInput, Age = ageInput))
    })

    output$plot1 <- renderPlot({
        agstInput <- input$sliderAGST

        plot(wine$AGST, wine$Price, xlab = "AGST",
         ylab = "Price", bty = "n", pch = 16,
         xlim = c(10, 20), ylim = c(0, 10))
        abline(wine_model1, col = "red", lwd = 2)

        points(agstInput, model1pred(), col = "red", pch = 16, cex = 2)
    })

    output$plot2 <- renderPlot({
        ageInput <- input$sliderAge

        plot(wine$Age, wine$Price, xlab = "Age",
         ylab = "Price", bty = "n", pch = 16,
         xlim = c(1, 40), ylim = c(0, 10))
        abline(wine_model2, col = "blue", lwd = 2)

        points(ageInput, model2pred(), col = "blue", pch = 16, cex = 2)
    })


    output$pred1 <- renderText({
        model1pred()
    })

    output$pred2 <- renderText({
        model2pred()
    })

    output$pred3 <- renderText({
    model3pred()
    })
})