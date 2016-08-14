library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Central Limit Theorem"),
    sidebarPanel(
        withMathJax(),  # For latex code
        
        # You can choose different values of n
        sliderInput('n', 'Choose the value of $$n:$$',
                    value = 1, min = 1, max = 100,
                    step = 1),
        h5('$$X_i \\sim Exp(\\lambda), \\lambda = 0.2 $$')
        ),

    mainPanel(
        withMathJax(),
        h5('$$\\text{Histogram for } X = \\frac{X_1+
           \\cdots+X_n}{n}$$'),
        plotOutput('newHist')
        )

))
