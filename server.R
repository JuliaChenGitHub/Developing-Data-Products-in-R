#library(shiny)

function(input, output) {
   
  mtcars$cyl<-as.factor(mtcars$cyl)
  mtcars$vs<-as.factor(mtcars$vs)
  mtcars$am<-as.factor(mtcars$am)
  mtcars$gear<-as.factor(mtcars$gear)
  mtcars$carb<-as.factor(mtcars$carb)
  names <- names(mtcars)
  
  X <- eventReactive(input$run,{as.numeric(input$selectX)})
  Y <- eventReactive(input$run,{as.numeric(input$selectY)})
  subcars <- eventReactive(input$run,{ mtcars[,c(as.numeric(input$selectY),as.numeric(input$selectX))]})
  
  model <- reactive({lm(mtcars[,Y()] ~ mtcars[,X()], mtcars)})
  
  output$plot <- renderPlot({
                 plotmodel <- model
                 plot(mtcars[,X()],mtcars[,Y()],xlab = names[X()], ylab = names[Y()], main="Univeriate Regression" )
                 abline(lm(mtcars[,Y()] ~ mtcars[,X()], mtcars), col="red",lwd=1)
                 
                  
    })
  
  output$summary <- renderPrint({
   
      summary(model())
      
    })
  output$test <- renderTable(subcars())
  
}