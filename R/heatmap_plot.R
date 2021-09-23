
# Helpers ------------------------------------------------------------

# Helper to put or remove data row names in the heatmap
heatmap_row_names <- function(select, data_set) {
  if (select == "Put") {
    row_names <- rownames(data_set)
  } else {
    row_names <- FALSE
  }
}

# Helper to put or remove data column names in the heatmap
heatmap_col_names <- function(select, data_set) {
  if (select == "Put") {
    col_names <- colnames(data_set)
  } else {
    col_names <- FALSE
  }
}

# Helepr to set column or row side colors in the heatmap
side_colors <- function(dataset, margin = 1) {
  
  if (margin == 1) levels_name <- rownames(dataset)
  else if (margin == 2) levels_name <- colnames(dataset)
  else stop("Please, choose a valid margin (1 or 2)")
  
  levels_name <- as.numeric(as.factor(levels_name))
  
  color_ramp <- colorRampPalette(
    RColorBrewer::brewer.pal(12, "Paired"), bias = 5
  )(length(levels_name))
  
  color_ramp
  
}

# Heatmap plot function ---------------------------------------------------

heatmap_plot <- function(data_set, heatmap_colors, colside, dendrogram, x_lab, 
                         y_lab, xlab_space, ylab_space, row_names, col_names,
                         cex_row, cex_col) {
  ## Heatmap colors
  plot_colors <- colorRampPalette(
    RColorBrewer::brewer.pal(8, heatmap_colors)
    )(100)
  
  ## Plot heatmap 
  if (colside == "column") {
    
    gplots::heatmap.2(
      data_set,
      trace = "none",
      dendrogram = dendrogram,
      ColSideColors = side_colors(data_set, 2),
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
      RowSideColors = side_colors(data_set, 1),
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
      RowSideColors = side_colors(data_set, 1),
      ColSideColors = side_colors(data_set, 2),
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
