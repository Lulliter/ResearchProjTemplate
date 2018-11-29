If there is a heavy computation (e.g. models or simulations), I write a script in R and save the results in a .rds file. 
Often I use remote machine for this kind of computation. 
Then I insert an R script in a Rmd chunk not evaluated and load the results in an evaluated one.

 ## ```{r heavy_computation, eval=FALSE}
 ## source("rscript/complicated_model.R")
 ## ```
 
 ## ```{r load_results}
 ## mod_results <- readRDS("model_result.rds")
 ## ```
 
 
 Because my .Rmd don’t live in the root directory, I add a setup chunk on all these files. This way, I’m to process my .Rmd directly or even use Rstudio’s notebook feature.

 ## ```{r setup, include=FALSE}
 ## knitr::opts_knit$set(root.dir = '../.')
 ## ```
When I have to rebuild all the reports (e.g. due to some raw data changes), I just run the script run_all.R.

#==================================================================================================#

DEBUGGING FUNCTIONS 

If I add `browser()` in the function code (any where), it will stop there and analyze for me 
I I click `traceback` it points where the error is 