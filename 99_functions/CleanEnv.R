#======  Clean up the environment

# This deletes the workspace file (accidentally saved)  
unlink(".RData") 
# Clear console (identical to Ctrl+L)
cat("\014") 

# Clean workspace
rm(list=ls())
# Clear plots
if(!is.null(dev.list())) dev.off()