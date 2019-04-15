library(shiny)
library(tidyverse)
library(plotly)
library(ggthemes)
library(shinydashboard)

options(scipen = 999)


arrivals <- read.csv("arrivals.csv", stringsAsFactors = FALSE)

#Subset Latin American countries

arrivals <- arrivals %>% 
  select(c("Year", "Argentina", "Belize", "Bolivia", "Brazil",
           "Chile", "Colombia", "Costa.Rica", "Ecuador", "El.Salvador",
           "Guatemala", "Guyana", "Honduras", "Mexico", "Nicaragua", "Panama",
           "Paraguay", "Peru", "Suriname", "Uruguay", "Venezuela..RB")) %>%
  rename("Venezuela" = "Venezuela..RB")

latam <- arrivals %>% 
  gather(Country, Arrivals, Argentina:Venezuela, factor_key=TRUE)
