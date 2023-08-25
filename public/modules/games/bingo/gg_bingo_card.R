library(tidyverse)
require(hrbrthemes)

free_space <- FALSE

bingo_words <- c("install.packages()",
                 "library()",
                 "tidyverse",
                 "readr",
                 "read_csv()",
                 "write_csv()",
                 "<-",
                 "c()",
                 "rm()",
                 "nrow()",
                 "ncol()",
                 "head()",
                 "dplyr",
                 "glimpse()",
                 "arrange()",
                 "filter()",
                 "select()",
                 "ggplot2",
                 "ggplot()",
                 "geom_col()",
                 "mean()",
                 "min()",
                 "max()",
                 "sum()",
                 "quantile()",
                 "=")

bingo_card <- tibble(item = sample(bingo_words, 16))

bingo_card <- mutate(bingo_card,
                     row = 0:(n()-1) %/% 4 + 1,
                     col = 0:(n()-1) %% 4 + 1,
                     item = ifelse(free_space & row == 2 & col == 2, "Free\nSpace", item),
                     p = runif(16))

ggplot(bingo_card, aes(x = col, y = row, label = item, color = item, fill = p)) +
  geom_tile(aes(width=0.95, height=0.95), size = 1) +
  geom_text(color = "white") +
  theme_ft_rc(plot_title_size = 24) +
  #theme_void() +
  theme(legend.position = "none") + 
  labs(title = "R BINGO",
       x = "", y = "")
  