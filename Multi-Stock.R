# download and install required packages
if (!require("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
  library(dplyr)
}
if (!require("tidyquant", quietly = TRUE)) {
  install.packages("tidyquant")
  library(tidyquant)
}
if (!require("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
  library(ggplot2)
}

# List of tickers to download
tickers = c("AAPL", "QQQ", "SPY", "VOO", "VTI", "HIMS")

# download data
prices <- tq_get(tickers,
                 from = "2020-01-01",
                 to = Sys.Date(),
                 get = "stock.prices")

# plot the data using ggplot
prices %>%
  ggplot(aes(x = date, y = adjusted, color = symbol)) +
  geom_line() +
  facet_wrap(~symbol,scales = 'free_y') +
  theme_classic() +
  labs(x = 'Date',
       y = "Adjusted Price",
       title = "Price Chart") +
  scale_x_date(date_breaks = "month",
               date_labels = "%b\n%y")

# Save the plot as a pdf
pdf(file = 'prices.pdf')
prices %>%
  ggplot(aes(x = date, y = adjusted, color = symbol)) +
  geom_line() +
  facet_wrap(~symbol,scales = 'free_y') +
  theme_classic() +
  labs(x = 'Date',
       y = "Adjusted Price",
       title = "Price Chart") +
  scale_x_date(date_breaks = "month",
               date_labels = "%b\n%y")
dev.off()

# Write the data to a text file
write.table(prices, "prices.txt", row.names = FALSE)
