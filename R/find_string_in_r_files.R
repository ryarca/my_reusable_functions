# This code searches for string(use it for function, R objects, params or other) 
# target_object in all R files within the working directory

# Define the target string name
target_string <- "ui"

# List all R files in the Shiny app directory and its subdirectories
r_files <- list.files(path = ".", pattern = "\\.R$", recursive = TRUE)

# Initialize a variable to track whether the object is found
string_found <- FALSE

# Iterate over each R file and search for the target string
for (file in r_files) {
  file_content <- readLines(file)
  string_indices <- grep(target_string, file_content)
  
  if (length(string_indices) > 0) {
    cat("String", target_string, "found in", file, "at lines:", string_indices, "\n")
    string_found <- TRUE
  }
}

# Print a message if the string is not found
if (!string_found) {
  cat("String", target_object, "not found in any R files.\n")
}
