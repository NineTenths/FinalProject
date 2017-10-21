#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(quantmod)

# Define server logic required to draw a histogram
server <- function(input, output) {
  tkr <- reactive({
    getSymbols(input$ticker,
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = F)
    })
  
  output$stockPlot <- renderPlot({
    chartSeries(tkr(),
                theme = input$theme)
    addBBands()
  })
  
  output$summary <- renderUI({HTML("<p><strong><u>Dow Jones Stock Explorer</u></strong></p>
<p>This app allows the user to explore stock history of the companies listed on the Dow Jones Industrial Average.</p>
<p><br /> The panel on the left contains the following elements:</p>
<ul>
<li>&lsquo;Stock&rsquo;: Select a stock from the drop-down list</li>
<li>&lsquo;Date range&rsquo;: Select the start and end dates for the stock price that you would like to see.</li>
<li>&lsquo;Chart Color&rsquo;: Select the color of the chart theme.</li>
</ul>
<p>Any changes made to the side panel will immediately be reflected in the plot on the main panel.</p>")})
  
}