library(shiny)
library(tidyverse)
library(plotly)
library(scales)
library(shinyWidgets)
library(shinycssloaders)
library(shinyFeedback)



function(input, output, session) {

  observeEvent(input$info_button_sampleexponential, {
    show_alert(
      session = session,
      title   = "",
      text    = tags$div(
        tags$h3("Information",
                style = "color: #0076C8; font-weight: bold; text-align: center"),
        tags$br(), tags$br(),
        style = "text-align: justify;
        margin-left:  auto;
        margin-right: auto;",
        tags$b('Lifetime modeling of "n" identical components of a system',
               style = "font-weight: bold"),
        tags$br(), tags$br(),
        'What is the probability that all components of a system last more
        than "x" years?',
        tags$br(), tags$br(),
        'This app uses a model based on an exponential distribution to analyze
        the lifetime of a system that contains a specified number of identical
        components.',
        tags$br(),
        'The average lifetime of a component and the number of identical
        components in the system determine the probability that the system will
        remain operational after "x" years.',
      ),
      html  = TRUE,
      width = "55%"
    )
  })

  output$plot <- renderPlotly({
    validate(need(input$beta > 0 && input$unit_time > 0, 'Missing values!'))
    plot_fun(input$n, input$beta, input$unit_time)
  })


}
