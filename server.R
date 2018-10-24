library(shiny)
shinyServer(function(input, output) {
 
 model1 <- lm(Fertility ~ Agriculture, data = swiss)
  model2 <- lm(Fertility ~ I(Agriculture + Education), data = swiss)
  
  
  model1pred <- reactive({
    
    AgriInput<-input$SliderAgri
    predict(model1,newdata=data.frame(Agriculture=AgriInput))
    
  })
  
  model2pred <- reactive({
    AgriInput<-input$SliderAgri
    EduInput<-input$SliderEdu
    predict(model2,newdata=data.frame(Agriculture=AgriInput,Education=EduInput))
   
    
  })

  
  output$Plot1 <- renderPlot({
    AgriInput<-input$SliderAgri
    EduInput<-input$SliderEdu
    
    plot(swiss$Agriculture,swiss$Fertility,xlab = "Agriculture",
         ylab = "Fertility",bty="n",pch=15,xlim=c(0,100),ylim = c(0,100))
    if(input$ShowModel1){
      abline(model1,col="red",lwd=2)
    }
    if(input$ShowModel2){
      abline(model2,col="Blue",lwd=2)
      
      
    }
      
    legend(25, 250, c("Model 1 Prediction", "Model 2 Prediction"), pch = 16, 
           col = c("red", "blue"), bty = "n", cex = 1.2)
    points(AgriInput, model1pred(), col = "red", pch = 16, cex = 2)
    points(EduInput, model2pred(), col = "blue", pch = 16, cex = 2)
  })
  
  output$pred1 <- renderText({
    model1pred()
  })
  
 output$pred2 <- renderText({
    model2pred()
  })
})
