# 照片生成製圖----
### 在r函數裡面使用python指令
# 載入套件
library(reticulate)

# 查詢python path
reticulate::py_config()$python

#  v1.19 版本之前創造python環境的指令 ----
## 創建python virtual environment
reticulate::py_create_virtualenv(venv_path = "~/econDV-practice", python_path = "/usr/local/bin/python3")
## 啟用python virtual environment
reticulate::py_activate_virtualenv(venv_path = "~/econDV-practice") 
## 退出python virtual environment
py_deactivate_virtualenv()
### reticulate пакет在 v1.19 版本之后就不再包含 py_create_virtualenv 和 py_activate_virtualenv 函数了


# 在工作目錄創建環境 ----
use_python("/Users/yuning/.virtualenvs/r-reticulate/bin/python")
virtualenv_create(envname = "econDV-prctice")

# 啟用環境
use_virtualenv("econDV-prctice")

# 安裝python套件 ----
reticulate::py_install("openai")

# openai讀取圖片產生描述 ----
# 定義函數
py_openai_pic_des <- function(api_key, image_url) {
  
  # 載入 OpenAI 套件
  py_import("openai")
  
  # 建立 OpenAI 客戶端
  client <- py_call("openai.OpenAI", api_key = api_key)
  
  # 設定訊息
  messages <- list(
    list(
      role = "user",
      content = list(
        list(type = "text", text = "使用繁體中文說明這圖在說什麼"),
        list(
          type = "image_url",
          image_url = list(url = image_url)
        )
      )
    )
  )
  
  # 呼叫 OpenAI API
  response <- py_call(client, "chat.completions.create", 
                      model = "gpt-4-vision-preview",
                      messages = messages,
                      max_tokens = 300)
  
  # 輸出結果
  py_return(response)
}

# 使用範例
api_key <- "..."
image_url <- "https://tpemartin.github.io/112-2-econDV/20181020_WOC443_0.jpeg"

result <- py_run_openai(api_key, image_url)

print(result$choices[[1]])







# read data
library(readr)
exchangeRate <- read_csv("~/Downloads/BP01M01.csv")

# 讀取數據
consumer_sentiment <- read.table(header = TRUE, text = "
Year  Sentiment
2000   90.3
2001   62.4
2002   62.9
2003   60.4
2004   80.7
2005   88.5
2006   87.3
2007   92.9
2008   64.1
2009   55.3
2010   71.8
2011   64.8
2012   67.1
2013   77.6
2014   84.6
2015   98.1
2016   91.8
2017   97.7
2018   98.4
2019  96.8
2020   81.0
2021   88.3
2022   65.2
2023   59.0 
2024   62.0
")

library(ggplot2)
library(dplyr)

# 將數據轉換為時間序列
consumer_sentiment$Year <- as.numeric(consumer_sentiment$Year)
consumer_sentiment_ts <- ts(consumer_sentiment$Sentiment, start = c(2000), end = c(2024), frequency = 1)

# 繪製圖形
results$graph_description <- ggplot(consumer_sentiment, aes(x = Year, y = Sentiment)) +
  geom_line() +
  geom_hline(yintercept = 100, linetype = "dashed") + 
  scale_x_continuous(breaks = seq(2000, 2024, 5)) +
  labs(title = "United States, consumer sentiment, 1966=100",
       x = "Year",
       y = "Sentiment Index") +
  theme_minimal()

