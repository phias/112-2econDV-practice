# {{視覺化學分數據}} -----
library(tidyverse)

# 載入資料
my_credits <- read_csv("my credits.csv")

# 整理資料
credits <- credits %>%
  pivot_longer(cols = -c(學期, 總學分), names_to = "subject", values_to = "credit") %>%
  filter(credit != 0) %>%  # I cannot uderstand here
  transform(semester = as.integer(gsub("\D", "", 學期)),
            period = substr(學期, 1, 4))


# 創建 ggplot 物件
p <- ggplot(my_credits, aes(x = reorder(學期, -semester), y = credit, fill = subject)) +
  labs(title = "跨領域學習學分",
       subtitle = "每學期的學分數",
       x = "學期", y = "學分",
       caption = "Data Source: My transcript") +
  theme_minimal() +
  theme(axis.line.x = element_line(colour = "black"))

# 繪製堆疊長條圖
p <- p + geom_col(position = "stack")

# 顯示圖形
p

