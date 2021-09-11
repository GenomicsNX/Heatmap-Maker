# 
# # Expression data 2 -------------------------------------------------------
# 
# library(genefilter)
# 
# # Data from https://www.ebi.ac.uk/arrayexpress/experiments/E-MTAB-10668/
# 
# exp_data <- read.delim(file = "data_2/L1000_processed.txt") 
# symbol <- exp_data$SYMBOL
# 
# exp_data <- exp_data[, - c(1, 2, 3)]
# exp_data <- as.matrix(exp_data)
# row.names(exp_data) <- symbol
# 
# # The 45 genes with the highest variance across samples
# 
# exp_rvars <- rowVars(exp_data)
# rvars_id <- order(exp_rvars, decreasing = TRUE)[1:45]
# exp_data_sub <- exp_data[rvars_id, ]
# 
# # Export data
# 
# write.table(exp_data_sub, file = "data/expression_data_2.txt")
# write.table(exp_data_sub, file = "data/expression_data_2.tsv", sep = "\t")
# write.csv(exp_data_sub, file = "data/expression_data_2.csv")
