#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Model Selection for Predicting Fertility in swiss Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      #sliderInput("sliderMPG", "What is the MPG of the car?", 10, 35, value = 20),
       sliderInput("SliderAgri","What is the Agriculture value?",1,90,value = 20),
       sliderInput("SliderEdu","What is the Education Level?",1,55,value = 20),
       checkboxInput("ShowModel1","Show/Hide Model 1",value = T),
       checkboxInput("ShowModel2","Show/Hide Model 2",value = T)),
    
    # Show a plot of the generated distribution
    mainPanel(
      h4("Here we are goint to predict the Fertility using  Two Models one with Ariculture and another with including
         both Agriculture and Education"),
       plotOutput("Plot1"),
       h3("Predict Fertility from Model1:"),
       textOutput("pred1"),
       h3("Predict Fertility from Model2:"),
       textOutput("pred2")
       
    )
  )
))
