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
        tags$br(),
        tags$br(),
        style = "text-align: justify;
        margin-left:  auto;
        margin-right: auto;",
        tags$b("Lifetime modeling of 'n' identical components of a circuit",
               style = "font-weight: bold"),
        tags$br(),
        tags$br(),
        'The Bateman function is commonly used to study the dynamics of drugs
          administered extravasally in a single-compartment model.',
        tags$br(),
        'By selecting the rate of absorption from the extravascular site of
          drug administration, selecting the rate of elimination of the drug by
          whatever mechanism occurs, and selecting the concentration of the drug
          at the initial time',
        tags$b(
          'we can determine the maximum bioavailability and maximum
            concentration using the Bateman curve.',
          style = "font-weight: bold"
        )
      ),
      html  = TRUE,
      width = "55%"
    )
  })

  output$plot <- renderPlotly({
    plot_fun(input$n, input$beta)
  })


}
