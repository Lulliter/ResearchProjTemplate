
# REFE http://haven.tidyverse.org/articles/semantics.html
library(stringi)
library(stringr)
library(qdapRegex)
library(haven)

# rm_between(x, '"', '"', extract=TRUE)
file.exists("../EnterpriseSurvey/Brazil2009_FullData/Brazil2009.dta")

F.Stata2R <- function(pathQ, fileQ) { 
  
  pathNQ <-   c(str_view(pathQ, '"\\S+"'))
  fileNQ <- c(str_view(fileQ, '"\\S+"'))
  quotes <- "\""
  
  read_dta(print(str_c("\"" ,pathNQ, fileNQ,"\"")) )
  
} 

pathQ <- "../EnterpriseSurvey/Brazil2009_FullData/"
fileQ <- "Brazil2009.dta"

R_file <- F.Stata2R(pathQ, fileQ)


#--------------------
gsub("\"", '"\\S+"', pathQ)

library(qdapRegex)
rm_between(pathQ, "\"" ,"\"", extract=TRUE)

s <- "PRODUCT colgate good but not goodOKAY"
s2 <- sub(".*PRODUCT *(.*?) *OKAY.*", "\\1", s)

sub(".*\" *(.*?) *\".*", '"\\S+"', pathQ)
