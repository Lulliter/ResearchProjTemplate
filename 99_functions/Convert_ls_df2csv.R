# ========================== # ES individual Input files by  *Campaign_Type*  2 csv 
# check which datasets are there tthrough auto-complete
# # data()
# setwd("~/GoogleDrive/R_functions")
# getwd()
# 
# # Loading
# mtcars <- as.data.frame(mtcars)
# iris <- as.data.frame(iris)
# Orange <- as.data.frame(Orange)
# 
# 
# #++++++++++++++++++++++++++++++++++++++++++# PRE FUNCTION (3 steps) #+++++++++++++++++++++++++++++++++++++++++++++++++++++++# 
# 
#           # a) Create a list of n data frames
#           list_dfs <- list(mtcars, iris ,  Orange) # generically named 'data.frame' 
#           list_dfs[1]
#           # name the data frames
#           names(list_dfs) <- c("mtcars","iris", "orange") 
# 
# # b) Create a list of n data frames with their specific name 
# list_dfs_N <- list(mtcars = mtcars,iris = iris , orange = Orange) # specifically  named 'df name' 
# 
# 
# # save each new data frame as an individual .csv file based on its name
# lapply(1:length(list_dfs_N), function(i) write.csv(list_dfs_N[[i]], 
#                                                  file = paste0(names(list_dfs_N[i]), ".csv"),
#                                                  row.names = FALSE))

#++++++++++++++++++++++++++++++++++++++++++# MY FIRST FUNCTION #+++++++++++++++++++++++++++++++++++++++++++++++++++++++# 
getwd()

F_listDFs_2CSVs <- function(list_dfs_N) {
  
  # NOT NEEDED if I put names in list # 
  #names(list_dfs_N) <- letters[1:length(list_dfs_N)] # some expression to create a name for each DF in the list 
 #  OutDir <- dir.create(path = "./Output/")
 # setwd(OutDir)
  
  lapply(1:length(list_dfs_N), # function  
         function(i) write.csv(list_dfs_N[[i]], file = paste0(names(list_dfs_N[i]), ".csv"), row.names = FALSE)
         )
}


#++++++++++++++++++++++++++++++++++++++++++# EXE MY ACTUAL LIST of DF in environment #++++++++++++++++++++++++++++++++++++++# 
# # Loading IF THEY ARE NOT ALREADY IN THE GLOB ENV 
  # NOT NEEDED if DF ALREADY THERE # 
  # mtcars <- as.data.frame(mtcars)
  # iris <- as.data.frame(iris)
  # orange <- as.data.frame(Orange)

# list_dfs_N <- list(mtcars = mtcars,iris = iris , orange = Orange)


#++++++++++++++++++++++++++++++++++++++++++# I CALL THE FUNCTION #++++++++++++++++++++++++++++++++++++++# 
# F_listDFs_2CSVs(list_dfs_N)


