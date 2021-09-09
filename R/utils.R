
# Constant values ---------------------------------------------------------

# Image dimensions
image_p <- 10
image_w <- 7
image_h <- 7

# Available colors (color blind friendly)
av_colors <- row.names(brewer.pal.info[brewer.pal.info$colorblind == TRUE, ])

# Slide inputs values
slide_values <- tibble::tribble(
  ~ id, ~ label, ~ min, ~ max, ~ value,
  "adj_xlab", "Adjust x label", 0, 10, 5,
  "adj_ylab", "Adjust y label", 0, 10, 5,
  "cex_col", "Adjust column name size", 0.5, 5, 2,
  "cex_row", "Adjust row name size", 0.5, 5, 2
)

# Select input values
select_values <- tibble::tribble(
  ~ id, ~ label, ~ choices,
  "heat_map_color", "Heatmap color:", av_colors,
  "dendrogram", "Dendrograms:", c("both", "row", "column", "none"),
  "colside", "Side colors:", c("both", "row", "column", "none"),
  "hp_row_names", "Heatmap row names:", c("Put", "None"),
  "hp_col_names", "Heatmap col names:", c("Put", "None")
)

# Functions ---------------------------------------------------------------

# Function to set slider inputs
set_slider_inputs <- function(id, label, min, max, value){
  sliderInput(id, label, min = min, max = max, value = value)
}

# Function to set select inputs
set_select_inputs <- function(id, label, choices){
  selectInput(id, label, choices = choices)
}

# UI select inputs
selects <- purrr::pmap(select_values, set_select_inputs)

# UI slider inputs
sliders <- purrr::pmap(slide_values, set_slider_inputs)
