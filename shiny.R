library(shiny)
library(ggplot2)
library(dplyr) 

holocaust_data <- read.csv('simulated_holocaust_victims.csv')

ui <- fluidPage(
  titlePanel("Holocaust Victims at Auschwitz"),
  
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("selectedNationalities", "Select Nationalities/Categories:",
                         choices = unique(holocaust_data$Nationality))
    ),
    mainPanel(
      plotOutput("nationalityPlot"),
      tableOutput("nationalityTable")
    )
  )
)

server <- function(input, output) {
  
  output$nationalityPlot <- renderPlot({
    filtered_data <- holocaust_data %>% 
      filter(Nationality %in% input$selectedNationalities)
    
    ggplot(filtered_data, aes(x = Nationality, y = Victims, fill = Nationality)) +
      geom_bar(stat = "identity") +
      theme_minimal() +
      scale_fill_brewer(palette = "Set1") +
      labs(x = "Nationality/Category", y = "Number of Victims", fill = "Nationality")
  })
  
  output$nationalityTable <- renderTable({
    holocaust_data %>% 
      filter(Nationality %in% input$selectedNationalities)
  })
}

shinyApp(ui = ui, server = server)
