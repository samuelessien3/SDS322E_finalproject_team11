library(dplyr)

input_file_path <- "/Users/ameliaengstrom/Desktop/Mixed_Beverage_Gross_Receipts.csv"
output_file_path <- "mixbev_txsub.csv"

# set subset size
subset_size <- 2100  # made 100 more than minimum dataset size

# read the entire CSV file into a data frame
data <- read.csv(input_file_path)
# filter to only have data with TX as state
data <- data %>% filter(Taxpayer.State=="TX")
# ensure the subset size is not larger than the total number of rows
subset_size <- min(subset_size, nrow(data))

# set a seed for reproducibility
set.seed(123)

# generate random indices to select rows
random_indices <- sample(1:nrow(data), subset_size)

# create a subset of rows based on the random indices
sub_data <- data[random_indices, ]

# write subset new CSV file with column headers
write.csv(sub_data, file = output_file_path, row.names = FALSE)

cat("Successfully created a random subset and saved it as", output_file_path, "\n")






