#=================================# ESEMPIO: Functions with condition {START} #=================================#
# https://www.guru99.com/r-functions-programming.html

# 1) BODY OF THE FUNCTION
if (train ==TRUE){ 
  train_df <- airquality[split, ] 
  return(train)		
} else {
  test_df <- airquality[-split, ] 
  return(test)		
}

# 2) THE FUNCTION
split_data <- function(df, train = TRUE){ # Our function "split_data()" takes two arguments 
  length<- nrow(df)
  total_row <- length *0.8 # we multiply the length of dataset "airquality" (i.e. number of observations) with 0.8.
  split <- 1:total_row     # to split the dataset 80/20 -> We create a list containing values from 1 to total_row
  
  if (train ==TRUE){ 
    train_df <- df[split, ]  # select the rows in the airquality dataset based on the values stored in the split variable 
    return(train_df)		# (*Lula add operations install/load * )
  } else {
    test_df <- df[-split, ]  # create the test dataset by using the remaining rows, 123:153. This is done by using – in front of split.
    return(test_df)		
  }
}

# 3) invoke THE FUNCTION
train <- split_data(airquality, train = TRUE)
dim(train)
## [1] 122   6
test <- split_data(airquality, train = FALSE)
dim(test)
## [1] 31  6
#=================================# ESEMPIO: Functions with condition {END} #=================================#