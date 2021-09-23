
# Load data function ------------------------------------------------------

load_data <- function(name, path, file = NULL){
  if (is.null(file)) {
    data <- as.matrix(sample_data)
  } else {
    ext <- tools::file_ext(name)
    if (ext == "csv") {
      
      data  <- read.csv(path, check.names = FALSE)
      row_names <- data[,1]
      col_names <- colnames(data)[-1]
      data  <- as.matrix(data[,-1])
      
      rownames(data) <- row_names
      colnames(data) <- col_names
      
    } else if (ext == "tsv") {
      data <- read.table(path, check.names = FALSE)
    } else if (ext == "txt") {
      data <- read.table(path, check.names = FALSE)
    } else {
      warning("Invalid file. Please updoload .csv, .txt or .tsv file")
    }
  }
  
  if (!is.matrix(data)) return(as.matrix(data))
  else return(data)
  
}
