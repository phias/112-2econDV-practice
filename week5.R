#claude 生成 ----
## 載入需要的套件 ----
library(ggplot2)
library(tidyverse)

# 載入需要的套件
library(ggplot2)
library(dplyr)

# 製作資料框架
cost_of_loving <- data.frame(
  City = c("Shanghai", "New York", "Bahrain", "Los Angeles", "Paris", "Amman", "Caracas", "Moscow", "Milan", "Beijing", "Barcelona", "St Petersburg", "Abu Dhabi", "Düsseldorf", "Zurich"),
  Meal = c(516, 487, 395, 356, 343, 331, 325, 324, 321, 317, 308, 300, 285, 282, 265),
  Wine = c(135, 132, 50, 80, 92, 60, 61, 71, 69, 67, 62, 60, 73, 72, 55),
  Drinks = c(52, 61, 38, 47, 43, 33, 30, 39, 43, 40, 38, 39, 36, 36, 38),
  Cinema = c(31, 37, 16, 27, 25, 15, 14, 21, 22, 20, 22, 19, 22, 22, 29),
  Taxi = c(16, 10, 11, 8, 15, 7, 5, 5, 8, 8, 14, 9, 6, 9, 9)
)

# 繪製長條圖
result <- ggplot(cost_of_loving, aes(x = reorder(City, -Meal), y = Meal, fill = "Meal")) +
  geom_col() +
  geom_col(aes(y = Wine), fill = "Wine") +
  geom_col(aes(y = Drinks), fill = "Drinks") +
  geom_col(aes(y = Cinema), fill = "Cinema") +
  geom_col(aes(y = Taxi), fill = "Taxi") +
  coord_flip() +
  labs(x = "", y = "", title = "Cost-of-loving index", subtitle = "Top 15 most expensive cities for a lavish date, 2023, $") +
  scale_fill_manual(values = c("Meal" = "#C0392B", "Wine" = "#E67E22", "Drinks" = "#7D3C98", "Cinema" = "#2471A3", "Taxi" = "#A93226"), name = "") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5), legend.position = "bottom")


# practice in class ----
## 載入需要的套件 ----
library(tidyverse)

# 設定資料網址 ----

# 設定資料網址
url_list <- list(
    "y104" = "https://stats.moe.gov.tw/files/ebook/native/104/104native_A1-1.csv",
    "y105" = "https://stats.moe.gov.tw/files/ebook/native/105/105native_A1-1.csv",
    "y106" = "https://stats.moe.gov.tw/files/ebook/native/106/106native_A1-1.csv",
    "y107" = "https://stats.moe.gov.tw/files/ebook/native/107/107native_A1-1.csv",
    "y108" = "https://stats.moe.gov.tw/files/ebook/native/108/108native_A1-1.csv",
    "y109" = "https://stats.moe.gov.tw/files/ebook/native/109/109native_A1-1.csv",
    "y110" = "https://stats.moe.gov.tw/files/ebook/native/110/110native_A1-1.csv",
    "y111" = "https://stats.moe.gov.tw/files/ebook/native/111/111native_A1-1.csv",
    "y112" = "https://stats.moe.gov.tw/files/ebook/native/112/112native_A1-1.csv"
    )

# 將網址列表轉換成 data frame
df_url <- data.frame(url = url_list)




# 儲存 data frame
saveRDS(df_url, "csv_download_urls.rds")




