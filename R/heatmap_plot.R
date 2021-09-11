
# Helpers ------------------------------------------------------------

# Helper to put or remove data row names in the heatmap
heatmap_row_names <- function(select, data_set) {
  if (select == "Put") {
    row_names <- rownames(data_set)
  } else {
    row_names <- FALSE
  }
}

# Helper to put or remove data column names in the heatmaps
heatmap_col_names <- function(select, data_set) {
  if (select == "Put") {
    col_names <- colnames(data_set)
  } else {
    col_names <- FALSE
  }
}

# Helper to set column side colors in the heatmap
colside_colors <- function(dataset) {
  column_levels <- as.numeric(as.factor(colnames(dataset)))
  palette(
    RColorBrewer::brewer.pal(8, "Dark2")
    )[column_levels]
}

# Helper to set row side colors in the heatmap
rowside_colors <- function(dataset) {
  row_levels <- as.numeric(as.factor(rownames(dataset)))
  palette(
    RColorBrewer::brewer.pal(8, "Dark2")
    )[row_levels]
}

# Heatmap plot function ---------------------------------------------------

heatmap_plot <- function(data_set, heatmap_colors, colside, dendrogram, x_lab, 
                         y_lab, xlab_space, ylab_space, row_names, col_names,
                         cex_row, cex_col) {
  ## Heatmap colors
  plot_colors <-colorRampPalette(
    RColorBrewer::brewer.pal(8, heatmap_colors)
    )(100)
  
  ## Plot heatmap 
  if (colside == "column") {
    
    gplots::heatmap.2(
      data_set,
      trace = "none",
      dendrogram = dendrogram,
      ColSideColors = colside_colors(data_set),
      col = plot_colors,
      labRow = row_names,
      labCol = col_names,
      margins = c(xlab_space, ylab_space),
      xlab = x_lab,
      ylab = y_lab,
      cexRow = (cex_row/10) + 1/log10(nrow(data_set)),
      cexCol = (cex_col/10) + 1/log10(ncol(data_set))
    )
    
  } else if (colside == "row") {
    
    gplots::heatmap.2(
      data_set,
      trace = "none",
      dendrogram = dendrogram,
      RowSideColors = rowside_colors(data_set),
      col = plot_colors,
      labRow = row_names,
      labCol = col_names,
      margins = c(xlab_space, ylab_space),
      xlab = x_lab,
      ylab = y_lab,
      cexRow = (cex_row/10) + 1/log10(nrow(data_set)),
      cexCol = (cex_col/10) + 1/log10(ncol(data_set))
    )

  } else if (colside == "both") {
    
    gplots::heatmap.2(
      data_set,
      trace = "none",
      dendrogram = dendrogram,
      RowSideColors = rowside_colors(data_set),
      ColSideColors = colside_colors(data_set),
      col = plot_colors,
      labRow = row_names,
      labCol = col_names,
      margins = c(xlab_space, ylab_space),
      xlab = x_lab,
      ylab = y_lab,
      cexRow = (cex_row/10) + 1/log10(nrow(data_set)),
      cexCol = (cex_col/10) + 1/log10(ncol(data_set))
    )
    
    
  } else {
    
    gplots::heatmap.2(
      data_set,
      trace = "none",
      dendrogram = dendrogram,
      col = plot_colors,
      labRow = row_names,
      labCol = col_names,
      margins = c(xlab_space, ylab_space),
      xlab = x_lab,
      ylab = y_lab,
      cexRow = (cex_row/10) + 1/log10(nrow(data_set)),
      cexCol = (cex_col/10) + 1/log10(ncol(data_set))
    )
    
  }
}
