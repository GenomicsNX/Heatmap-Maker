# 
# # Metabolomic data --------------------------------------------------------
# 
# # Simulated data considering means and standard deviations reported in
# # https://pubmed.ncbi.nlm.nih.gov/17118972/
# 
# library(tidyverse)
# 
# # Import Data
# paper_data <- read_csv("data/paper_data.csv")
# 
# # Spread data
# met_data <- paper_data %>% 
#   select(-SD) %>% 
#   spread(key = TIME, value = MEAN) 
# 
# # Metabolite names
# met_names <- met_data$MET
# 
# # Convert to a matrix
# met_data <- as.matrix(met_data[,-1])
# rownames(met_data) <- met_names
# 
# # Export data
# write.table(met_data, file = "data/metabolomic_data.txt")
# write.table(met_data, file = "data/metabolomic_data.tsv", sep = "\t")
# write.csv(met_data, file = "data/metabolomic_data.csv")
