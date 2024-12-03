library(mice)
library(dplyr)

dataset <- read.csv("./uncleaned_data.csv")
str(dataset)

# Replace empty strings or whitespace-only values with NA
replace_empty_with_na <- function(data) {
  data[] <- lapply(data, function(x) {
    if (is.character(x) || is.factor(x)) {
      x <- trimws(as.character(x)) 
      x[x == ""] <- NA 
    }
    return(x)
  })
  return(data)
}

mice_imputation <- function(data, column_name, m = 5) {
  # Check if the specified column exists in the data
  if (!(column_name %in% names(data))) 
    stop(paste("Error: Column", column_name, "does not exist."))
  
  # Convert the specified column to a factor, which is necessary for categorical imputation
  data[[column_name]] <- as.factor(data[[column_name]])
  
  # Create a method list for imputation, specifying methods for each column
  imputation_methods <- make.method(data)
  
  # Set the imputation method for the target column to "polyreg" (polynomial regression)
  imputation_methods[column_name] <- "polyreg"
  
  # Perform the multiple imputation using the mice package
  # m specifies the number of multiple imputations to create
  imputed_data <- mice(data, method = imputation_methods, m = m)
  
  # Extract the completed dataset from the imputed data; 1 specifies the first imputed dataset
  completed_data <- complete(imputed_data, 1)
  
  # Return the dataset with imputed values
  return(completed_data)
}


dataset <- replace_empty_with_na(dataset)
sum(is.na(dataset))

# Apply the transformations and overwrite dataset
dataset <- dataset %>%
  mutate(across(where(is.character), as.factor)) %>%
  replace_empty_with_na() %>%
  mice_imputation("destination") %>%
  mice_imputation("passanger") 


# Verify the NA count after transformations
sum(is.na(dataset))

