#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Dow Stock History"),
  
  # Sidebar with a slider input for number of cars and passengers 
  sidebarLayout(
    sidebarPanel(
      selectInput("ticker","Stock",
                  c("Apple" = "AAPL",
                     "American Express" = "AXP",
                     "Boeing" = "BA",
                     "Caterpillar" = "CAT",
                     "Cisco Systems" = "CSCO",
                     "Chevron" = "CVX",
                     "Coca-Cola" = "KO",
                     "DuPont" = "DD",
                     "ExonMobil" = "XOM",
                     "General Electric" = "GE",
                     "Goldman Sachs" = "GS",
                     "Home Depot" = "HD",
                     "IBM" = "IBM",
                     "Intel" = "INTC",
                     "Johnson & Johnson" = "JNJ",
                     "JPMorgan Chase" = "JPM",
                     "McDonald’s" = "MCD",
                     "3M Company" = "MMM",
                     "Merck" = "MRK",
                     "Microsoft" = "MSFT",
                     "Nike" = "NKE",
                     "Pfizer" = "PFE",
                     "Procter & Gamble" = "PG",
                     "The Travelers" = "TRV",
                     "United Health" = "UNH",
                     "United Technologies" = "UTX",
                     "Visa" = "V",
                     "Verizon" = "VZ",
                     "Wal-Mart" = "WMT",
                     "Walt Disney" = "DIS")
        
      ),
      dateRangeInput("dates",
                     "Date range",
                     start = "2013-01-01", 
                     end = as.character(Sys.Date())),
      radioButtons("theme","Chart Color",
                   choiceNames = list("Black","White"),
                   choiceValues = list("black","white")
                   )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput("stockPlot")),
        tabPanel("About", htmlOutput("summary"))
      )
      
    )
  )
)
