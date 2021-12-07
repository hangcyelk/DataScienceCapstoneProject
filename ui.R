
suppressWarnings(library(shiny))
suppressWarnings(library(markdown))
suppressWarnings(library(shinyBS))
suppressWarnings(library(shinythemes))
shinyUI(fluidPage("Coursera Data Science Capstone: Course Project", theme = shinytheme("united"),
                   tabPanel("Word Prediction",
                          HTML("<strong>Author: Chengyu Hang</strong>"),
                          br(),
                          HTML("<strong>Date: December 4, 2021</strong>"),
                          br(),
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Enter the word in the box"),
                                textInput("inputString", "Write here",value = "")
                              ),
                              mainPanel(
                                h2("Prediction"),
                                verbatimTextOutput("prediction"),
                                strong("User's sequence"),
                                tags$style(type='text/css', '#answer {background-color:color: white;}'), 
                                textOutput('answer'),
                                br(),
                                strong("Which dataset has been used?"),
                                tags$style(type='text/css', '#method {background-color:color: white;}'),
                                textOutput('method')
                              )
                            )
                   )
                   
)
)



# 
# 
# suppressWarnings(library(shiny))
# shinyUI(fluidPage("Data Science Capstone Shiny Application: What's the next word?",
#                   tabPanel("Predicting the next word",
#                            HTML("<strong>Author: Chengyu Hang</strong>"),
#                            br(),
#                            HTML("<strong>Date: December 4, 2021</strong>"),
#                            br(),
#                            # Sidebar
#                            sidebarLayout(
#                              sidebarPanel(
#                                helpText("Enter the word in the box, system will guess your next word"),
#                                textInput("input", "Enter your word here",value = ""),
#                                br(),
#                                br(),
#                                br(),
#                                br()
#                              ),
#                              mainPanel(
#                                h2("Predicted word"),
#                                textOutput("prediction")
#                                
#                              )
#                            )
#                            
#                   )
# )
# )