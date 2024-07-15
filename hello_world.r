print("Hello, World!")

print('Estatística')


file_path <- "datasets/olist_order_items_dataset.csv"

dados <- read.csv(file_path, header = TRUE, sep = ",", stringsAsFactors = FALSE)

df <- data.frame(dados)

print(head(df))