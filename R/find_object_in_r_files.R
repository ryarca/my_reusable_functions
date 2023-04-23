# This code searches for an object (function, R object, params or other) target_object
# in all R files within the working directory

# Define the target object name
target_object <- "your_object_name"

# List all R files in the Shiny app directory and its subdirectories
r_files <- list.files(path = ".", pattern = "\\.R$", recursive = TRUE)

# Iterate over each R file and search for the target object
for (file in r_files) {
  file_content <- readLines(file)
  object_indices <- grep(target_object, file_content)
  
  if (length(object_indices) > 0) {
    cat("Object", target_object, "found in", file, "at lines:", object_indices, "\n")
  }
}