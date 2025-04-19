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
        tags$b("Lifetime modeling of 'n' identical components of a circuit",
               style = "font-weight: bold"),
        tags$br(), tags$br(),
        'What is the probability that all the componentes last more than "x"
        years?',
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
