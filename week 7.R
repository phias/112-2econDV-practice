# 載入需要的套件
library(tidyverse)

# 建立原始資料
data <- tribble(
  ~degree, ~public, ~private, ~total,
  "Bachelor", 40, 10, 50,
  "Master", 65, 35, 55,
  "PhD", 70, 30, 60
)

# 將資料長寬轉換
data_long <- data %>%
  pivot_longer(cols = c(public, private, total),
               names_to = "school",
               values_to = "propotion")

# 建立堆疊長條圖
ggplot(data_long, aes(x = degree, y = propotion, fill = school)) +
  geom_col(position = "dodge") + # 這裡使用"dodge"而非"stack"
  labs(title = "Private vs. Public aboriginal students proportion",
       x = "Degree",
       y = "Aboriginal to Total Student share (%)") +
  scale_fill_manual(values = c("skyblue", "green3", "deeppink3"),
                    labels = c("Total", "Public", "Private"),
                    name = "school") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5)) + # 將標題置中
  scale_y_continuous(expand = c(0, 0)) # 確保y=0時長條觸碰x軸

# 讀取原始資料
stockdata <- read_csv("~/Downloads/STOCK_DAY_2454_202403.csv")

# 時間格式轉換
stockdata$date <- as.Date(stockdata$日期, "%Y/%m/%d")
date <- paste0(1911+year(stockdata$date), month(stockdata$date), day(stockdata$date))

