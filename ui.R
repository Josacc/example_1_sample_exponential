library(shiny)
library(tidyverse)
library(readxl)
library(plotly)
library(scales)
library(DT)
library(shinydashboard)
library(shinyWidgets)
library(shinycssloaders)
library(shinyFeedback)


fluidPage(
  titlePanel("Lifetime modeling of n identical components of a circuit"),
  br(), br(),
  fluidRow(
    column(
      width = 3,
      h4(
        p(strong('Sample pdf exponential')),
        style = 'color: #3c8dbc'
      )
    ),
    column(
      width = 1,
      actionBttn(
        inputId = 'info_button_sampleexponential',
        label   = '',
        icon    = icon('info-circle'),
        style   = 'jelly'
      )
    )
  ),
  br(),
  sidebarLayout(
    sidebarPanel(
      width = 5,
        HTML(paste0((
          "<b style = 'font-weight: bold;'>
          Choice the average life length of a component (time unit):
           </b>"))),
      fluidRow(
        column(
          width = 3,
          numericInput(
            inputId = 'beta',
            label   = '',
            value   = 1,
            min     = 1,
            max     = 100,
            step    = 1
          ),
        ),
        column(width = 3)
      ),
       br(),
      HTML(paste0((
        "<b style = 'font-weight: bold;'>
          Choose the number of identical components in the circuit:
           </b>"))),
      sliderInput(
        inputId = 'n',
        label   = '',
        value   = 10,
        step    = 1,
        min     = 1,
        max     = 100,
        animate = TRUE
      )
    ),
    mainPanel(
      width = 7,
      plotOutput(outputId = 'plot')
    )
  )
)
