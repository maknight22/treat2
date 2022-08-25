#current 2.0
#next step, move calculations behind requirement check
#handle unfound model error for those without enough variables

library(shiny)
library(shinythemes)

# Define UI for application
shinyUI(fluidPage(theme = shinytheme("united"),

    # Application title
    titlePanel("TREAT 2.0"),
    h4("Lung Cancer Prediction in High-Risk Indeterminate Pulonary Nodules"),
    
    wellPanel(fluidRow(
      column(3,
             numericInput("age", "Age*", value = NA, min = 0),
             numericInput("bmi_new", "BMI", value = NA, min = 0),
             selectInput("growthcat", "Lesion Growth", choices = c("Insufficient Data","Growth Observed", "No Lesion Growth")),
             radioButtons("gender", "Gender*", inline = TRUE, choices = c("Male", "Female"), selected = character(0)),
             radioButtons("spicul", "Spiculated Lesion Edge?", inline = TRUE, choices = c("Yes", "No", "Missing"), selected = "Missing"),
             radioButtons("upperlobe", "Upper Lobe?*", inline = TRUE, choices = c("Yes", "No"),selected = character(0)),
             numericInput("fev1", "Predicted FEV", value = NA, min = 0)
             
      ),
      column(3,
             numericInput("packs", "Pack Years*", value = NA, min = 0),
             numericInput("size", "Lesion Size (mm)*", value = NA),
             selectInput("group", "Setting of Evaluation", choices = c("Select a Location" = "","Pulmonary Nodule Clinic", "Thoracic Surgery Clinic", "Surgical Resection")),
             radioButtons("prev_cancer", "Previous Cancer?", inline = TRUE, choices = c("Yes", "No", "Missing"), selected = "Missing"),
             radioButtons("anysympt", "Pre-Op Symptoms?", inline = TRUE, choices = c("Yes", "No", "Missing"), selected = "Missing"),
             radioButtons("petavid", "FDG-PET Avid?", inline = TRUE, choices= c("Yes", "No", "Missing"), selected = "Missing"),
             #radioButtons("group", "Setting of Evaluation", choices = c("Pulmonary Nodule Clinic", "Thoracic Surgery Clinic", "Surgical Resection", "Missing"), selected = "Missing"),
             helpText("* Required fields"),
             actionButton("submit", "Submit", class = "btn-primary")
      ),
      column(6,
             
             tableOutput("result")
             )
    ))

))
