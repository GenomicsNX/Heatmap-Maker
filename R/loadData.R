
# Load data module --------------------------------------------------------

loadDataUI <- function(id) {
  tagList(
    fileInput(NS(id, "file"), "Upload a file", accept = c(".csv", ".tsv", ".txt"))
  )
}

loadDataServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    reactive(load_data(input$file$name, input$file$datapath, input$file))
  })
}
