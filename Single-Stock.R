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

# download data
AAPL <- tq_get('AAPL',
               from = "2020-01-01",
               to = Sys.Date(),
               get = "stock.prices")

# plot the data using ggplot
AAPL %>%
  ggplot(aes(x = date, y = adjusted)) +
  geom_line() +
  theme_classic() +
  labs(x = 'Date',
       y = "Adjusted Price",
       title = "Apple price chart") +
  scale_y_continuous(breaks = seq(0,300,10))

# Save the plot as a pdf
pdf(file = 'aapl.pdf')
AAPL %>%
  ggplot(aes(x = date, y = adjusted)) +
  geom_line() +
  theme_classic() +
  labs(x = 'Date',
       y = "Adjusted Price",
       title = "Apple price chart") +
  scale_y_continuous(breaks = seq(0,300,10))
dev.off()

# Write the data to a text file
write.table(AAPL, "AAPL.txt", row.names = FALSE)
