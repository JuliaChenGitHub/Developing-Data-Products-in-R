library(shiny)

# Define UI for random distribution application 
fluidPage(
  
  # Application title
  titlePanel("Univerate Analysis of mtcars"),
  
  tags$p(style="color:red","Instruction: select dependent and independent variable from the dropdown lists 
         and hit the Run lm(y_x) button.The program will run a univerate regression based on your selection
         and show the results on the right"),

  sidebarLayout(
    sidebarPanel(
      selectInput("selectY", label = h5("Dependent variable(Y) :"), 
                  choices = list("mpg"=1, "disp"=3, "hp"=4, "drat"=5, "wt"=6, "qsec"=7), 
                  selected = 1),
    
      selectInput("selectX", label = h5("Independent variable(X) :"), 
                  choices = list("mpg"=1, "cyl"=2,"disp"=3, "hp"=4, "drat"=5, "wt"=6, "qsec"=7, "vs"=8, "am"=9, "gear"=10, "carb"=11), 
                  selected = 4),
      br(),
      actionButton(inputId = "run", style="font-weight: bold",label = "Run lm(y~x)  ")
    ),
    
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Plot", plotOutput("plot")), 
                  tabPanel("Summary", verbatimTextOutput("summary")),
                  tabPanel("Table", tableOutput("test"))
                  
                  
      )
    )
  ),
  tags$i("This program tries to simplify the univeriate analysis of mtcars. mtcars has 11 variables, 
with 5 of them factors <cyl,vs,am,gear,carb> and the rest numerics. User can choose dependent variables from the 6 
numeric variables and independent variables from all 11 variables through dropdown lists. After click the run button,
the program will run an univeriate regression based on the selection. Three resutls will be rendered --a plot with regression 
line, a summary of the model, and a data table. If the user choose to investigate other variable pairs, just make new selections\
and click the run button. The results will be updated instantly. ")
)