# Trillion-dollar tech company market cap -----
library(tidyverse)
library(sf)

companies <- tribble(
  ~year, ~company, ~market_cap,
  2000, "Microsoft", 510040000000,
  2002, "Microsoft", 283821040000,
  2004, "Microsoft", 295477440000,
  2006, "Microsoft", 293780000000,
  2008, "Microsoft", 180185200000,
  2010, "Microsoft", 219134720000,
  2012, "Microsoft", 249272320000,
  2014, "Microsoft", 355376000000,
  2016, "Microsoft", 482198400000,
  2018, "Microsoft", 859371520000,
  2020, "Microsoft", 1631568000000,
  2000, "Amazon", 16545600000,
  2002, "Amazon", 6679200000,
  2004, "Amazon", 17517600000,
  2006, "Amazon", 19166400000,
  2008, "Amazon", 31764800000,
  2010, "Amazon", 74334400000,
  2012, "Amazon", 115655200000,
  2014, "Amazon", 150788800000,
  2016, "Amazon", 356789600000,
  2018, "Amazon", 737632000000,
  2020, "Amazon", 1592000000000,
  2004, "Alphabet", 51151200000,
  2006, "Alphabet", 117914400000,
  2008, "Alphabet", 115070400000,
  2010, "Alphabet", 193416000000,
  2012, "Alphabet", 249995200000,
  2014, "Alphabet", 345599200000,
  2016, "Alphabet", 546762400000,
  2018, "Alphabet", 766757600000,
  2020, "Alphabet", 1190000000000,
  2012, "Facebook", 63804800000,
  2014, "Facebook", 213555200000,
  2016, "Facebook", 368966400000,
  2018, "Facebook", 424764800000,
  2020, "Facebook", 792000000000,
  2012, "Apple", 556624000000,
  2014, "Apple", 642630400000,
  2016, "Apple", 586038400000,
  2018, "Apple", 851358400000,
  2020, "Apple", 2312120000000
)

companies %>%
  mutate(year = as.integer(year)) %>%
  glimpse()

ggplot(companies, aes(x = year, y = market_cap / 1000000000000, color = company)) +
  geom_line() +
  scale_y_continuous(limits = c(0, 2.5), expand = c(0, 0)) +
  scale_x_continuous(breaks = seq(2000, 2020, 2)) +
  labs(
    title = "Trillion-dollar tech",
    subtitle = "Market capitalisation ($tn)",
    x = NULL,
    y = NULL,
    caption = "Source: Data stream from Refinitiv, Bloomberg"
  ) +
  theme_minimal() +
  theme(axis.line.x = element_line(colour = "black"))
