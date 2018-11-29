################################################
##		R version of a `makefile` 
################################################


################################################  
##		 Set Working Dir & WORKSPACE
################################################  

	#====== (Over -COMPLICATED)
	## root <- fs::path_abs(".") # Replace with "YourWorkingDirPath"
	## source(paste0(root,"/StartSession.R"))
	# getwd()

	#======  Restart R Session
	#.rs.restartR()

	#======  Clean up the environment
	# This deletes the workspace file. 
	unlink(".RData") 
	# Clear plots
	if(!is.null(dev.list())) dev.off()
	# Clear console (identical to Ctrl+L)
	cat("\014") 
	# Clean workspace
	rm(list=ls())

################################################  
##		Load Packages (SIMPLiciter!) 
################################################  

	##===  (0)
	library(pacman)

	

	##===   FROM CRAN
		list_packages <- c("rmarkdown","utils", "readstata13","rJava","devtools",  "here", # utilities
				 "xlsx","Hmisc","readxl","scales", "classInt",
				 "gapminder", # excerpt gapminder data on life expectancy, GDP per capita, and population x country
				 "tidyverse",  "magrittr",  # "purrr", "dplyr",  "tibble",  "ggplot2","tidyr", # tydydata
				 "reshape2", "ggthemes", "rcartocolor","RColorBrewer",  "grid", "ggmap", "tmap", "tmaptools", 
				 "units", "udunits2", "rgdal","rgeos", "sf", "sp" , "raster", # geosp 
				 "maps", "maptools", "raster","ggsn",
				 "plotly", "viridis", "leaflet", #interactive graphics
				 "kableExtra", "skimr", "desctable",  "stargazer", "xtable",   # presentation tables 
				 "plm",      # Panel data analysis library
				 "car",      # Companion to applied regression 
				 "gplots",   # Various programing tools for plotting data
				 "tseries",  # For timeseries analysis
				 "lmtest", # For heteroskedasticity analysis  `coeftest()` and `bptest()`.
				 "dynlm", #for function `dynlm()
				 "vars", # for function `VAR()`
				 "nlWaldTest", # for the `nlWaldtest()` function
				 "broom", #for `glance(`) and `tidy()
				 "sandwich", 
				 "forecast", "systemfit", "AER"
				 )

		p_load(char = list_packages, # Character vector containing packages to load
				 install = TRUE, 
				 update = getOption("pac_update"), 
				 character.only = FALSE
				)

		

	##=== check
		# p_isloaded(plm)


		

	##===   FROM GITHUB (individual packages)
		# p_install_gh(c("ccolonescu/PoEdata")) # , "trinker/regexr", "hadley/httr@v0.4"))
		p_load_gh(c("ccolonescu/PoEdata")) # ("Dasonk/githubSearch", "trinker/regexr", "hadley/httr@v0.4")

		

	##=== check
		# p_isloaded(PoEdata)


################################################
##		99_functions 
################################################

	##=== SOURCE NECESSARY FUNCTIONS
		all_functions <- list.files(path = "./99_Functions", pattern = '.R$' , 
									all.files = FALSE,  # def (= only visible)
									full.names = TRUE, #      I NEED dir name prepended
									recursive = FALSE,  # def  (= no inside sub-dir )
									ignore.case = TRUE, #    (= pattern-matching be case-insensitive)
									include.dirs = FALSE, # def (subdirectory names NOT be included in recursive listings)
									no.. = FALSE) %>% 
						sort(decreasing = FALSE)  # def (both "." and ".." be excluded also from non-recursive listings) 

		

	##=== Execute them them in the environment
		purrr::walk(all_functions, source, local = FALSE, echo = TRUE, verbose = TRUE) 





################################################
##		00_reference 
################################################
 
		##=== nothing to run here... ;) 



################################################
##		01_rawdata
################################################

		##=== RUN FILES TO CLEAN RAW DATA


################################################
##		02_munge <-- REQUIRES files 01_rawdata
##				--> SAVES results in ./03_cleandata/
################################################

##===  List of R scripts in order (they start with number)
all_munge <- list.files(path = "./02_munge", pattern = '.R$' , 
                        all.files = FALSE,  # def (= only visible)
                        full.names = TRUE, #      I NEED dir name prepended
                        recursive = FALSE,  # def  (= no inside sub-dir )
                        ignore.case = TRUE, #    (= pattern-matching be case-insensitive)
                        include.dirs = FALSE, # def (subdirectory names NOT be included in recursive listings)
                        no.. = FALSE) %>% sort(decreasing = FALSE)  # def (both "." and ".." be excluded also from non-recursive listings) 
all_munge

##===  Source them all ONE BY ONE 
        # source(all_munge[1], local = TRUE)
        # source(all_munge[2], local = TRUE)
        # source(all_munge[3], local = TRUE)
        # source(all_munge[4], local = TRUE)
        # source(all_munge[5], local = TRUE)
        # source(all_munge[6], local = TRUE)
        
##===  Source them all using purrr::walk
purrr::walk(all_munge, source, local = FALSE, echo = TRUE, verbose = TRUE) 

################################################  
# ???? ) run ALL .RMD files in ./???? / <-- {inspired by Course_ComputingForSocialSciences}
# =========== 
################################################  

# #!/usr/local/bin/Rscript --vanilla
# 
# # renders all .Rmd files in directory if the input file is older than the output file.
# # differs in that rmarkdown::render_site renders all files, regardless of modifications
# 
# render_site_mod <- function(infolder, outfolder, clean_site = FALSE) {
#   if(clean_site == TRUE){
#     rmarkdown::clean_site()
#     rmarkdown::render_site()
#   } else {
#     for (infile in list.files(infolder, pattern = "^[^_].*\\.R?md$", full.names = TRUE)) {
#       outfile = paste0(outfolder, "/", sub(".Rmd$", ".html", basename(infile)))
#       
#       # render only if the input file is the last one modified
#       if (!file.exists(outfile) |
#           file.info(infile)$mtime > file.info(outfile)$mtime) {
#         rmarkdown::render(infile)
#       }
#     }
#   }
# }
# 
# 
# render_site_mod(".", ".", commandArgs(trailingOnly = TRUE)[1])


################################################
##		03_cleandata
################################################

##===  List of files ending with <_sf.Rdata>
filesCLEAN <- list.files(path = "./03_cleandata/", pattern=".Rdata$", 
							 full.names = T # "xx$" = "ends with  xx"
							 # all.files = FALSE,
							 # full.names = FALSE, recursive = FALSE,
							 # ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
)   

##===  load in environment
lapply(filesCLEAN, load, environment())

##=== Remove some I don't need now'
	#ls()
	rm("gadm36_ARG_0_sf",  "gadm36_ARG_1_sf" )



################################################
##		04_explore <-- REQUIRES files 03_cleandata
################################################

################################################
##		05_cleanERdata 
################################################

################################################
##		06_analyze <-- REQUIRES files 05_cleanERdata
## 					--> SAVES results 07_output
################################################

################################################
##		07_output
################################################


################################################
##		100_extra 
################################################

	##=== nothing to run here... ;) 








