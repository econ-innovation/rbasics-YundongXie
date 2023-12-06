# 使用R中的数据读写，文件路径，for循环语句，读入路径“/assignment_idaccuracy/Aminer”总的所有文件，并将数据合并成为一个data.frame输出。
# 要求data.frame中至少要包括论文的doi号，发表年份，杂志，标题；

# 设置文件夹路径
folder_path <- "F:/论文及课程学习/2023-应用经济学中的大数据分析/第三讲 R语言基础-2/data/assignment_idaccuracy/Aminer"

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

# 显示合并后的数据框
print(merged_data)


# 使用apply家族函数替代上述步骤中的for循环
library(readr)

# 设置目录路径
directory_path <- "F:/论文及课程学习/2023-应用经济学中的大数据分析/第三讲 R语言基础-2/data/assignment_idaccuracy/Aminer"

# 列出目录中的所有文件
file_list <- list.files(path = directory_path, full.names = TRUE)

# 使用lapply将所有文件读入数据框的列表
data_list <- lapply(file_list, read_csv)

# 将数据框列表合并成一个数据框
combined_data <- do.call(rbind, data_list)  # 使用rbind进行行合并

# 或者，使用cbind进行列合并
# combined_data <- do.call(cbind, data_list)

# 打印或根据需要使用合并后的数据框
print(combined_data)



 

# 将2中代码封装成为一个可以在命令行运行的脚本，脚本的唯一一个参数为aminer论文文件所在的路径。

