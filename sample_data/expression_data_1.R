# 
# # Expression data 1 -------------------------------------------------------
# 
# library(tissuesGeneExpression)
# library(genefilter)
# 
# # Load the data
# 
# data(tissuesGeneExpression)
# 
# # The 45 genes with the highest variance across tissue samples 
# 
# rv <- rowVars(e)
# idx <- order(rv, decreasing = TRUE)[1:45]
# 
# # Data subset
# 
# e_sub <- e[idx, ]
# colnames(e_sub) <- tissue
# 
# # Export data
# write.table(e_sub, file = "data/expression_data_1.txt")
# write.table(e_sub, file = "data/expression_data_1.tsv", sep = "\t")
# write.csv(e_sub, file = "data/expression_data_1.csv")
