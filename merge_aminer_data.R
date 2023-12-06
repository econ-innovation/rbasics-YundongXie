# 从命令行获取路径参数
args <- commandArgs(trailingOnly = TRUE)

# 设置文件夹路径
folder_path <- args[1]

# 获取文件列表
file_list <- list.files(path = folder_path, pattern = ".csv", full.names = TRUE)

# 初始化一个空数据框
merged_data <- data.frame()

# 循环读取并合并数据
for (file in file_list) {
  # 读取数据
  current_data <- read.csv(file, header = TRUE)  # 这里假设文件是 CSV 格式的
  
  # 合并数据
  merged_data <- rbind(merged_data, current_data)
}

# 要求data.frame中至少要包括论文的doi号，发表年份，杂志，标题；
# 保存合并后的数据框到文件
write.csv(merged_data, "merged_data_output.csv", row.names = FALSE)
