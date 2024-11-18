# # Step 1: Load data
# data <- read.csv("in-vehicle-coupon-recommendation.csv")
# str(data)
# 
# # Step 2: Calculate total NA before inserting new NA
# total_na_before <- sum(is.na(data))
# print(paste("Total NA before:", total_na_before))
# 
# # Step 3: Generate random row-column indices
# set.seed(123)  # For reproducibility
# n_rows <- nrow(data)
# n_cols <- ncol(data)
# total_cells <- n_rows * n_cols
# 
# # Generate linear indices
# missing_indices <- sample(1:total_cells, size = 0.1 * total_cells)
# 
# # Convert linear indices to row and column indices
# row_col_indices <- arrayInd(missing_indices, .dim = c(n_rows, n_cols))
# 
# # Insert NA into the data frame
# for (i in seq_len(nrow(row_col_indices))) {
#   row <- row_col_indices[i, 1]
#   col <- row_col_indices[i, 2]
#   data[row, col] <- NA
# }
# 
# # Step 4: Calculate total NA after inserting new NA
# total_na_after <- sum(is.na(data))
# print(paste("Total NA after:", total_na_after))
# 
# # Step 1: Check the range of the `temperature` column
# summary(data$temperature)
# 
# # Step 2: Define thresholds for outliers
# # Assuming the range of `temperature` represents temperature
# set.seed(123)  # For reproducibility
# lower_outlier <- min(data$temperature, na.rm = TRUE) - 150  # Below minimum by 20 units
# upper_outlier <- max(data$temperature, na.rm = TRUE) + 20  # Above maximum by 20 units
# 
# # Step 3: Generate random indices for inserting outliers
# n_outliers <- 10  # Number of outliers to insert
# outlier_indices <- sample(which(!is.na(data$temperature)), size = n_outliers)
# 
# # Step 4: Insert outliers
# outlier_values <- sample(c(lower_outlier, upper_outlier), size = n_outliers, replace = TRUE)
# data$temperature[outlier_indices] <- outlier_values
# 
# # Step 5: Verify changes
# print("Outlier indices:")
# print(outlier_indices)
# print("Updated temperature column with outliers:")
# summary(data$temperature)
# 
# 
# #----------------------------------------------------------------------------------------------------
# data$weather <- as.factor(data$weather)
# data$time <- as.factor(data$time)
# data$education <- as.factor(data$education)
# 
# # Check the levels for each column
# weather_levels <- levels(data$weather)
# time_levels <- levels(data$time)
# education_levels <- levels(data$education)
# 
# # Create variations (uppercase, lowercase, capitalized)
# set.seed(123)  # For reproducibility
# 
# # Function to generate inconsistent case formats for a given vector of levels
# generate_inconsistent_data <- function(levels) {
#   variations <- c()
#   for (level in levels) {
#     variations <- c(variations, 
#                     toupper(level),      # Uppercase version
#                     tolower(level),      # Lowercase version
#                     tools::toTitleCase(level))  # Capitalized version
#   }
#   return(variations)
# }
# 
# # Generate inconsistent data for 'weather', 'time', and 'education'
# weather_inconsistent <- sample(generate_inconsistent_data(weather_levels), size = nrow(data), replace = TRUE)
# time_inconsistent <- sample(generate_inconsistent_data(time_levels), size = nrow(data), replace = TRUE)
# education_inconsistent <- sample(generate_inconsistent_data(education_levels), size = nrow(data), replace = TRUE)
# 
# data$weather <- weather_inconsistent
# data$time <- time_inconsistent
# data$education <- education_inconsistent
# 
# data$weather <- as.factor(data$weather)
# data$time <- as.factor(data$time)
# data$education <- as.factor(data$education)
# 
# 
# write.csv(data, "uncleaned_data.csv", row.names = FALSE)





