if (!require("tidyquant", quietly = TRUE)) {
  install.packages("tidyquant")
  library(tidyquant)
}
if (!require("plotly", quietly = TRUE)) {
  install.packages("plotly")
  library(plotly)
}

price_history <- tq_get('AAPL',
                    from = '2024-07-01',
                    to = Sys.Date(),
                    get = 'stock.prices')

price_history %>%
  plot_ly(x = ~date,
          type = 'candlestick',
          open = ~open,
          close = ~close,
          high = ~high,
          low = ~low) %>%
  layout(title = 'AAPL Price since July 2024',
         xaxis = list(rangeslider = list(visible = F)))