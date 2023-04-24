library(readr)

# Define the target string name
target_string <- "import_test"

# List all R and Python files in the directory and its subdirectories
r_files <- list.files(path = ".", pattern = "\\.R|py$", recursive = TRUE)

# Define a function to search for the target string in a file
search_string <- function(file, target_string) {
  file_content <- readr::read_lines(file, skip_empty_rows = TRUE)
  
  string_indices <- grep(target_string, file_content)
  
  if (length(string_indices) > 0) {
    cat("String", target_string, "found in", file, "at lines:", string_indices, "\n")
    return(TRUE)
  }
  return(FALSE)
}

# Use lapply to search for the target string in each R and Python file
string_found_list <- lapply(r_files, search_string, target_string = target_string)

# Check if the string was found in any file
string_found <- any(unlist(string_found_list))

# Print a message if the string is not found
if (!string_found) {
  cat("String", target_string, "not found in any R or Python files.\n")
}

