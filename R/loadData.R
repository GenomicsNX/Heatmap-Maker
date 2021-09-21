
# Load data module --------------------------------------------------------

loadDataUI <- function(id) {
  tagList(
    fileInput(
      NS(id, "file"), 
      NULL, 
      accept = c(".csv", ".tsv", ".txt"),
      buttonLabel = "Upload a file...",
      placeholder = "CSV (.csv), TSV (.tsv) or TXT (.txt) data file",
      width = '90%'
      )
  )
}

loadDataServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    reactive(load_data(input$file$name, input$file$datapath, input$file))
  })
}
