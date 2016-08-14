library(shiny)

shinyServer(
    function(input,output){
        nosim <- 10000
        output$newHist <- renderPlot({
        n <- input$n
        lambda <- 0.2
        dat <- apply(matrix(rexp(nosim*n, lambda), nosim),
                     1 , mean)
        # Histogram of mean sample
        hist(dat, main = "Sample Mean Distribution",
             breaks = 50, border = "gray", prob = TRUE,
             col = "LightBlue",
             xlab = "Sample Mean of 1000 simulation")
        # Density curve
        lines(density(dat), col = "blue", lwd = 2)
        # Density curve of a normal distribution
        xfit <-seq(min(dat),max(dat), length= 100)
        yfit <-dnorm(xfit, mean = 1/lambda, sd = 1/lambda/sqrt(n))
        lines(xfit, yfit, pch = 25, col ='red', lwd = 1)
        legend('topright',c('Sample mean density',
                            'Theoretical mean density'),
               col =c('red','blue'), lty =c(1,1))
    })
})
