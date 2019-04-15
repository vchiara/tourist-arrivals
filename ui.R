ui <- dashboardPage(title = "International Tourist Arrivals in Latin America",
      
  dashboardHeader(title = "Tourist Arrivals"),

  #Sidebar Layout
  dashboardSidebar(
    sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Data", tabName = "data", icon = icon("table"))
                )
              ),
    
  #Dashboard contents
  dashboardBody(
    tabItems(
      
      # First tab
      tabItem(tabName = "dashboard",
          
          fluidRow(
            valueBoxOutput("value1"),
            valueBoxOutput("value2"),
            valueBoxOutput("value3")
                ),      
                
          fluidRow(
            column(width = 12, align="center",
              box(width = NULL, status = "primary", solidHeader = F,
                selectInput("country", "Country:", 
                choices = c("Argentina" = "Argentina", 
                            "Belize" = "Belize",
                            "Bolivia" = "Bolivia",
                            "Brazil" = "Brazil",
                            "Chile" = "Chile",
                            "Colombia" = "Colombia",
                            "Costa Rica" = "Costa.Rica",
                            "Ecuador" = "Ecuador",
                            "El Salvador" = "El.Salvador",
                            "Guatemala" = "Guatemala",
                            "Guyana" = "Guyana",
                            "Honduras" = "Honduras",
                            "Mexico" = "Mexico",
                            "Nicaragua" = "Nicaragua",
                            "Panama" = "Panama",
                            "Paraguay" = "Paraguay",
                            "Peru" = "Peru",
                            "Suriname" = "Suriname",
                            "Uruguay" = "Uruguay",
                            "Venezuela" = "Venezuela")),
              
              helpText("World Bank Data for Tourist Arrivals in Latin America (1995-2016)"),

              sliderInput("year", "Year", 1995, 2016,
                  value = c(1995,2016)
                  )
            )
        ),
        
        column(width = 12, align="center",
              box(width = NULL,
                plotlyOutput("barplot"))
              )
            )
          ),
    
    #Second tab
    tabItem(tabName = "data",
      fluidRow(
      dataTableOutput("view")
          )
        )
      )
    )
  )