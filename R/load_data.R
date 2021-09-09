
# Load data function ------------------------------------------------------

load_data <- function(name, path, file = NULL){
  if (is.null(file)) {
    data <- read.table("data/expression_data_1.txt", check.names = FALSE)
    data <- as.matrix(data)
  } else {
    ext <- tools::file_ext(name)
    if (ext == "csv") {
      data  <- read.csv(path, check.names = FALSE)
      row_names <- data[,1]
      data  <- as.matrix(data[,-1])
      rownames(data) <- row_names
    } else if (ext == "tsv") {
      data <- read.delim(path, check.names = FALSE)
    } else if (ext == "txt") {
      data <- read.table(path, sep = ",", check.names = FALSE)
    } else {
      warning("Invalid file. Please updoload .csv, .txt or .tsv file")
    }
  }
  return(data)
}
