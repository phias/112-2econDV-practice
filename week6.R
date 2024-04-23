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



##### Need to fix the problems above python environment settings. #####



# read data ----
library(readr)
library(tidyverse)
exchangeRate <- read_csv("~/Downloads/BP01M01.csv")
results <- list()

# 轉換資料格式 ----
## 將文字資料轉換成日期格式
exchangeRate$date <- ym(exchangeRate$期間)

# 將日期格式轉換成時間序列格式
exchangeRate$date_ts <- ts(exchangeRate$date)


# 繪製圖形
library(ggplot2)
results$graph_description <- ggplot(exchangeRate, aes(x = Year, y = Sentiment)) +
  geom_line() +
  geom_hline(yintercept = 100, linetype = "dashed") + 
  scale_x_continuous(breaks = seq(2000, 2024, 5)) +
  labs(title = "United States, consumer sentiment, 1966=100",
       x = "Year",
       y = "Sentiment Index") +
  theme_minimal()




