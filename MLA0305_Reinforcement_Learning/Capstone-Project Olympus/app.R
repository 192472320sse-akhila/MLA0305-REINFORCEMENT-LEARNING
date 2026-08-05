# Project Olympus - app.R (Part 1 UI)

library(shiny)
library(bs4Dash)
library(shinyWidgets)
library(mclust)
library(DT)
library(plotly)
library(ggplot2)

ui <- dashboardPage(
  title = "Project Olympus",
  header = dashboardHeader(
    title = tagList(icon("traffic-light"), "Project Olympus")
  ),
  sidebar = dashboardSidebar(
    skin = "light",
    sidebarMenu(
      menuItem("Home", tabName="home", icon=icon("house")),
      menuItem("Dataset Generation", tabName="dataset", icon=icon("database")),
      menuItem("Data Analysis", tabName="analysis", icon=icon("chart-bar")),
      menuItem("Visualizations", tabName="visual", icon=icon("chart-line")),
      menuItem("GMM Analysis", tabName="gmm", icon=icon("brain")),
      menuItem("Reports", tabName="report", icon=icon("file"))
    )
  ),
  body = dashboardBody(
    fluidRow(
      valueBox("1000","Traffic Records",icon=icon("car"),color="primary"),
      valueBox("12","Parameters",icon=icon("table"),color="success"),
      valueBox("3","GMM Clusters",icon=icon("project-diagram"),color="warning")
    ),
    tabItems(
      tabItem(tabName="home",
        fluidRow(
          box(width=12,title="Project Overview",status="primary",solidHeader=TRUE,
              h1("PROJECT OLYMPUS"),
              h3("Adaptive Urban Traffic Intelligence"))
        )
      ),
      tabItem(tabName="dataset",
        fluidRow(
          box(width=12,title="Dataset Generation",status="success",solidHeader=TRUE,
              numericInput("records","Number of Records",1000,100,5000),
              actionButton("generate","Generate Dataset"),
              br(),br(),
              downloadButton("download","Download Dataset"),
              br(),br(),
              DT::DTOutput("data_table"),
              br(),
              verbatimTextOutput("summary_data")
          )
        )
      ),
      tabItem(tabName="analysis",h2("Data Analysis Module")),
      tabItem(tabName="visual",h2("Visualizations")),
      tabItem(tabName="gmm",h2("Gaussian Mixture Model Analysis")),
      tabItem(tabName="report",h2("Reports"))
    )
  )
)

server <- function(input, output, session) {
  
  traffic_data <- eventReactive(input$generate, {
    
    n <- input$records
    
    set.seed(123)
    
    k1 <- floor(n / 3)
    k2 <- floor(n / 3)
    k3 <- n - k1 - k2
    
    speed <- c(
      rnorm(k1, 35, 5),
      rnorm(k2, 60, 6),
      rnorm(k3, 85, 7)
    )
    
    waiting <- c(
      rnorm(k1, 50, 8),
      rnorm(k2, 25, 5),
      rnorm(k3, 8, 3)
    )
    
    queue <- c(
      rnorm(k1, 20, 4),
      rnorm(k2, 10, 3),
      rnorm(k3, 4, 2)
    )
    
    gmm_model <- Mclust(
      data.frame(speed, waiting, queue),
      G = 3
    )
    
    data.frame(
      Vehicle_ID = paste0("V", sprintf("%04d", 1:n)),
      Vehicle_Type = sample(c("Car", "Bus", "Bike", "Truck"), n, replace = TRUE),
      Road_ID = sample(paste0("R", 1:5), n, replace = TRUE),
      Lane_No = sample(1:4, n, replace = TRUE),
      Vehicle_Speed = round(speed, 1),
      Waiting_Time = round(waiting, 1),
      Queue_Length = round(queue, 1),
      Traffic_Density = sample(c("Low", "Medium", "High"), n, replace = TRUE),
      Signal_State = sample(c("Green", "Yellow", "Red"), n, replace = TRUE),
      Weather = sample(c("Sunny", "Rainy", "Foggy"), n, replace = TRUE),
      Time_of_Day = sample(c("Morning", "Afternoon", "Evening", "Night"), n, replace = TRUE),
      GMM_Cluster = gmm_model$classification
    )
    
  })
  
  output$data_table <- DT::renderDT({
    
    req(traffic_data())
    
    datatable(
      traffic_data(),
      options = list(
        pageLength = 10,
        scrollX = TRUE
      )
    )
    
  })
  
  output$summary_data <- renderPrint({
    
    req(traffic_data())
    
    summary(traffic_data())
    
  })
  
  output$download <- downloadHandler(
    
    filename = function() {
      "Traffic_Dataset.csv"
    },
    
    content = function(file) {
      write.csv(
        traffic_data(),
        file,
        row.names = FALSE
      )
    }
    
  )
  
}

shinyApp(ui, server)
