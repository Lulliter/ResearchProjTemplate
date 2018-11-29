library(fs)
fs::path_abs("..")
fs::path_abs(".")

# ObjectiFY SubDirs	
from.dir <- "./05_Output" # My R proj Dir 
fs::path_abs(from.dir)

to.dir   <- "./LAC-maps/images" # Shared(!!) Google Drive Dir 
fs::path_abs(to.dir)

# List Files 
files <- list.files(path = from.dir,
						  # pattern='\\.csv$', # an optional regular expression. (ends with)
						  full.names = TRUE, # If TRUE, the directory path is prepended to the file names to give a relative file path. If FALSE, the file names (rather than paths) are returned.
						  recursive = TRUE) # Should the listing recurse into directories?
class(files) # character vectors, containing file names or paths.

# function to MOVE
for (f in files) file.copy(from = f, # character vectors, containing file names (!!!!!) or paths.
									to = to.dir, # character vectors, containing file names or paths.
									overwrite = T , # They have the date in the name so OLD is not really deleted 
									copy.date = T # should file dates be preserved where possible? 
									)
