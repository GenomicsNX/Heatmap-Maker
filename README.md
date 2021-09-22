HeatmapMaker v 1.0.0 
================

A shiny app to make heat maps from TXT, CSV and TSV data files.

You can use HeatmapMaker through three options:

#### 1

Simply download it from this GitHub page or through GitHub Desktop. Once in the HeatmapMaker main folder, juct double click the .Rproj file and type in the R console (you need devtools pacakge):

`devtools::laod_all(".")`

and then:

`heatMapApp()`

#### 2

Install the app as a package with the next code:

`devtools::install_github("jpch26/Heatmap-Maker")`

then:

`library(HeatmapMaker)`

and finally:

`heatMapApp()`

#### 3

Use the app directly, without R or RStudio, by clicking in the next link:

https://r-inthelab-net.shinyapps.io/HeatmapMaker/ 

 

Possibly, the third will not be a long term option to use the app because shinyapp.io just allow to publish five apps simultaneously. I hope in the future I will able to find a good solution for this (or maybe I will pay for it...).

Currently I'm working on a brief tutorial to explain the types of data and the several options in the app, thank you :)

22/Sept/2021

Juan Pablo Carreón Hidalgo

<jpch_26@outlook.com>

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
