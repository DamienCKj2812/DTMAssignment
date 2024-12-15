library(mice)
library(dplyr)

dataset <- read.csv("./uncleaned_data.csv")
str(dataset)

D# Replace empty strings or whitespace-only values with NA
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

replace_outliers_with_na <- function(data, column_name, multiplier = 1.5) {
  if (!is.numeric(data[[column_name]])) {
    stop("The input column must be numeric.")
  }
  
  Q1 <- quantile(data[[column_name]], 0.25, na.rm = TRUE)
  Q3 <- quantile(data[[column_name]], 0.75, na.rm = TRUE)
  IQR_value <- Q3 - Q1
  
  lower_bound <- Q1 - multiplier * IQR_value
  upper_bound <- Q3 + multiplier * IQR_value
  
  data[[column_name]][data[[column_name]] < lower_bound | data[[column_name]] > upper_bound] <- NA
  
  return(data)
}

median_imputation <- function(data, column_name) {
  if (!is.numeric(data[[column_name]])) {
    stop("The input column must be numeric.")
  }
  median_value <- median(data[[column_name]], na.rm = TRUE)
  data[[column_name]][is.na(data[[column_name]])] <- median_value
  return(data)
}

# lowercase the data that is inconsistent
dataset$weather <- tolower(dataset$weather)
dataset$time <- tolower(dataset$time)
dataset$education <- tolower(dataset$education)

dataset$age <- as.numeric(dataset$age)
sum(is.na(dataset))


# Apply the transformations and cleaning
dataset <- dataset %>%
  mutate(across(where(is.character), as.factor)) %>%
  replace_empty_with_na() %>%
  mice_imputation("destination") %>%
  mice_imputation("passanger") %>%
  mice_imputation("weather") %>%
  replace_outliers_with_na(., "temperature") %>%
  median_imputation(., "temperature") %>%
  mice_imputation("time") %>%
  mice_imputation("coupon") %>%
  mice_imputation("expiration") %>%
  mice_imputation("gender") %>%
  median_imputation(., "age") %>%
  mice_imputation("maritalStatus") %>%
  mice_imputation("has_children")  %>%
  mice_imputation("education") %>%
  mice_imputation("occupation") %>%
  mice_imputation("income") %>%
  mice_imputation("car") %>%
  mice_imputation("Bar") %>%
  mice_imputation("CoffeeHouse") %>%
  mice_imputation("CarryAway") %>% 
  mice_imputation("RestaurantLessThan20") %>% 
  mice_imputation("Restaurant20To50") %>%  
  mice_imputation("toCoupon_GEQ5min") %>%  
  mice_imputation("toCoupon_GEQ15min") %>% 
  mice_imputation("toCoupon_GEQ25min") %>%  
  mice_imputation("direction_same") %>%  
  mice_imputation("direction_opp") %>%  
  mice_imputation("Y")  

# Verify the NA count after transformations
sum(is.na(dataset))

write.csv(dataset, "./cleaned_data.csv", row.names = FALSE)




