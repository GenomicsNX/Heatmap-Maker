
heatMapApp <- function() {
  ui <- fluidPage(
    theme = bslib::bs_theme(bootswatch = "cerulean", font_scale = 0.8),
    titlePanel("Heatmap Maker v 1.0.0"),
    sidebarLayout(
      sidebarPanel(
        fluidRow(
          loadDataUI("load_data"),
          column(6, 
                 textInput("x_lab", "X label"),
                 textInput("y_lab", "Y label"),
                 selects
          ),
          column(6,
                 sliders
          )
        )
      ),
      mainPanel(
        plotOutput("plot", height = 700),
        textInput("filename", "File name:", placeholder = "My heatmap"),
        radioButtons("format", "Choose format", c("png", "bmp", "pdf"), inline = TRUE),
        downloadButton("download", "Download Heatmap"),
      )
    ),
  )
  
  server <- function(input, output) {
    
    data <- loadDataServer("load_data")
    
    # Heatmap column names
    col_names <- reactive(heatmap_col_names(input$hp_col_names, data()))
    
    # Heatmap row names
    row_names <- reactive(heatmap_row_names(input$hp_row_names, data()))
    
    # Display Heatmap
    output$plot <- renderPlot(
      heatmap_plot(data(), input$heat_map_color, colside = input$colside,
                   dendrogram = input$dendrogram, x_lab = input$x_lab, 
                   y_lab = input$y_lab, xlab_space = input$adj_xlab,
                   ylab_space = input$adj_ylab, row_names = row_names(),
                   col_names = col_names(), cex_row = input$cex_row, 
                   cex_col = input$cex_col), 
      res = 96
    )
    
    # Download Heatmap
    output$download <- downloadHandler(
      filename = function() {
        paste0(input$filename, ".", input$format)
      },
      content = function(file) {
        if (input$format == "png") {
          png(
            file, width = image_w, height = image_h, res = 300,
            units = "in", pointsize = image_p
          )
        } else if (input$format == "bmp") {
          bmp(
            file, width = image_w, height = image_h, res = 300,
            units = "in", pointsize = image_p
          )
        } else {
          pdf(file, pointsize = image_p)
        }
        heatmap_plot(data(), input$heat_map_color, colside = input$colside,
                     dendrogram = input$dendrogram, x_lab = input$x_lab, 
                     y_lab = input$y_lab, xlab_space = input$adj_xlab,
                     ylab_space = input$adj_ylab, row_names = row_names(),
                     col_names = col_names(), cex_row = input$cex_row, 
                     cex_col = input$cex_col)
        dev.off()
      }
    )
  }

  shinyApp(ui = ui, server = server)

}

heatMapApp()
