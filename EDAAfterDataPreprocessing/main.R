library(ggplot2) 
D
data <- read.csv("./cleaned_data.csv")
str(data)

# EDA on destination
destination_data_frame <- as.data.frame(table(data$destination, useNA = "ifany"))
destination_data_frame

# EDA on passenger
passenger_data_frame <- as.data.frame(table(data$passanger, useNA = "ifany"))
passenger_data_frame

# EDA on weather
weather_data_frame <- as.data.frame(table(data$weather, useNA = "ifany"))
weather_data_frame

#EDA on temperature
ggplot(data, aes(x = temperature, y = temperature)) +
  geom_boxplot() +
  labs(title = "Boxplot of Temperature", y = "Temperature") 

# EDA on time
time_data_frame <- as.data.frame(table(data$time, useNA = "ifany"))
time_data_frame

# EDA on coupon
coupon_data_frame <- as.data.frame(table(data$coupon, useNA = "ifany"))
coupon_data_frame

# EDA on expiration
expiration_data_frame <- as.data.frame(table(data$expiration, useNA = "ifany"))
expiration_data_frame

# EDA on gender
gender_data_frame <- as.data.frame(table(data$gender, useNA = "ifany"))
gender_data_frame

# EDA on maritalStatus
maritalStatus_data_frame <- as.data.frame(table(data$maritalStatus, useNA = "ifany"))
maritalStatus_data_frame

# EDA on has_children
has_children_data_frame <- as.data.frame(table(data$has_children, useNA = "ifany"))
has_children_data_frame

# EDA on education
education_data_frame <- as.data.frame(table(data$education, useNA = "ifany"))
education_data_frame

# EDA on occupation
occupation_data_frame <- as.data.frame(table(data$occupation, useNA = "ifany")) 
occupation_data_frame

# EDA on income
income_data_frame <- as.data.frame(table(data$income, useNA = "ifany")) 
income_data_frame

# EDA on car
car_data_frame <- as.data.frame(table(data$car, useNA = "ifany")) 
car_data_frame

# EDA on Bar
bar_data_frame <- as.data.frame(table(data$Bar, useNA = "ifany")) 
bar_data_frame

# EDA on CoffeeHouse
coffee_house_data_frame <- as.data.frame(table(data$CoffeeHouse, useNA = "ifany")) 
coffee_house_data_frame

# EDA on CarryAway
carry_away_data_frame <- as.data.frame(table(data$CarryAway, useNA = "ifany")) 
carry_away_data_frame

# EDA on RestaurantLessThan20
restaurant_less_than_20_data_frame <- as.data.frame(table(data$RestaurantLessThan20, useNA = "ifany")) 
restaurant_less_than_20_data_frame

# EDA on Restaurant20To50
restaurant_20_to_50_data_frame <- as.data.frame(table(data$Restaurant20To50, useNA = "ifany")) 
restaurant_20_to_50_data_frame

# EDA on toCoupon_GEQ5min
to_coupon_geq_5_min_data_frame <- as.data.frame(table(data$toCoupon_GEQ5min, useNA = "ifany")) 
to_coupon_geq_5_min_data_frame

# EDA on toCoupon_GEQ1D15min
to_coupon_geq_15_min_data_frame <- as.data.frame(table(data$toCoupon_GEQ15min, useNA = "ifany")) 
to_coupon_geq_15_min_data_frame

# EDA on toCoupon_GEQ1D25min
to_coupon_geq_25_min_data_frame <- as.data.frame(table(data$toCoupon_GEQ25min, useNA = "ifany")) 
to_coupon_geq_25_min_data_frame

# EDA on direction_same
direction_same_data_frame <- as.data.frame(table(data$direction_same, useNA = "ifany")) 
direction_same_data_frame

# EDA on direction_opp
direction_opp_data_frame <- as.data.frame(table(data$direction_opp, useNA = "ifany")) 
direction_opp_data_frame

# EDA on Y(dependent variable)
y_data_frame <- as.data.frame(table(data$Y, useNA = "ifany")) 
y_data_frame
