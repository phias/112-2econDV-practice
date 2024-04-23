# practice in class ----
library(tidyverse)
library(ggplot2)
# Data preparation
candidate <- c("candidate A", "candidate B", "candidate C")
support_rate <- c(40.05, 33.49, 26.45)
data <- tibble(
  candidates = c("candidate A", "candidate B", "candidate C"),
  support_rate = c(40.05, 33.49, 26.45)
)

# Create bar chart
myPlot <- ggplot(data, aes(x = candidate, y = support_rate)) +
  geom_bar(stat = "identity", fill = c("Red", "Green", "Blue")) +
  labs(title = "2024 presidential election", subtitle = "unit: percentage") +
  theme_minimal() +
  scale_y_continuous(c(0, 0))

# Modify fill color
myPlot <- myPlot + geom_bar(stat = "identity", fill = c("#67c167", "#4372c4", "#7ededd"))

# prit bar chart
print(myPlot)

# practice by myself ----


# Read the XML file ----
doc <-read_xml("~/Downloads/就業人數-從業身分別.xml")

# Extract data using xml2 functions
nodes <- xml_children(xml_root(doc))  # get all child nodes of root

# Define an empty data frame
df <- data.frame()

# Loop through child nodes and extract data
for (i in 1:length(xml_children(doc))) {
  
  # 取得 DataTable 節點
  node <- xml_child(doc, i)
  
  # 取得類別 1 標題
  category1 <- xml_text(xml_child(node, "./Category1Title"))
  
  # 取得類別 2 標題
  category2 <- xml_text(xml_child(node, "./Category2Title"))
  
  # 取得類別 3 標題
  category3 <- xml_text(xml_child(node, "./Category3Title"))
  
  # 取得類別 4 標題
  category4 <- xml_text(xml_child(node, "./Category4Title"))
  
  # 取得類別 5 標題
  category5 <- xml_text(xml_child(node, "./Category5Title"))
  
  # 取得時期
  period <- xml_text(xml_child(node, "./Period"))
  
  # 取得值
  value <- xml_text(xml_child(node, "./Val"))
  
  # 新增資料列
  df <- rbind(df, data.frame(類別1 = category1,
                             類別2 = category2,
                             類別3 = category3,
                             類別4 = category4,
                             類別5 = category5,
                             時期 = period,
                             值 = value))
}


