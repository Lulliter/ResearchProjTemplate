# ipak function: install and load multiple R packages.
# check to see if packages are installed. Install them if they are not, then load them into the R session.

ipak <- function(pkg){ # function arguments (pkg)
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])] # Expression(s) 
  
  if (length(new.pkg)) # IF (condition)
    install.packages(new.pkg, dependencies = TRUE) #(THEN) EXPRESSION
    sapply(pkg, require, character.only = TRUE) # Take all X(pkg), apply FUNC (require) , extra arg
}

# usage
packages <- c("rmarkdown","utils", 
              "rgdal","sp","rgeos", "sf", "units", "udunits2", 
              
              "dplyr", "reshape2", "kableExtra", "skimr", 
              "ggplot2", "RColorBrewer",  "grid", "ggmap","tmap", "tmaptools", "classInt", "plotly", "viridis", "ggthemes", "rcartocolor"
              )


ipak(packages)


# ======== Pacman VERSION ======================#


# packageVersion("ggplot2") # [1] ‘2.2.1.9000’
# 
# library(pacman)
# p_install_version("ggplot2", version = "2.2.1.9000")
# p_install_version(  c("pacman", "testthat"),  c("0.2.0", "0.9.1"))
# 
# p_load	# = Install CRAN Packages + Load
# p_load_gh	# = Install GitHub Packages + Load
# p_isinstalled(aprof) # 
# p_isloaded(aprof) # 
# p_loaded(aprof) # = List Attached Packages
# p_loaded(ggplot2)
# # p_ver(ggplot2)
# # p_version(ggplot2)
# # p_information(ggplot2)
# p_info(package = ggplot2, fields = "Version")
# p_info(package = ggplot2, fields = "Built") # Built for R version???
# 
# #+++++++++++++++++ githubinstall VERSION ======================#
# # install.packages("githubinstall")
# library(githubinstall)
#   gh_suggest("survey") #  returns the suggested repository names as a vector.
#   survey_packages <- gh_search_packages("survey") # search by keyword ==
#   head(survey_packages) 
#   
# 
# 
# # ======== LULA VERSION ======================#

# EXPRESSIONS
# 1. Determine VERSION CRAN of packages
# 2. Determine VERSION DEV of packages
# 3. define vesion CRAN ok
# 4. define version DEV OK


# RETURN (OUTPUT)

# 1. IFELSE -> 
      

