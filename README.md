Heatmap Maker
================

A shiny app to make heat maps from TXT, CSV and TSV data files.

You can use HeatmapMaker through three options:

#### 1

Simply download it from this GitHub page or through GitHub Desktop. Once in the HeatmapMaker main directory, just double click the .Rproj file and type in the R console (you need devtools package):

`devtools::laod_all(".")`

and then:

`HeatmapMaker()`

#### 2

Install the app as a package with the next code:

`devtools::install_github("jpch26/Heatmap-Maker")`

then:

`library(HeatmapMaker)`

and finally:

`HeatmapMaker()`  

To do the above, you can also run the file app.R in HeatmapMaker main directory.

#### 3

Use the app directly, you do not need R or RStudio, by clicking in the next link:

https://r-inthelab-net.shinyapps.io/HeatmapMaker/ 

 

Possibly, the third will not be a long term option to use the app because shinyapp.io just allow to publish five apps simultaneously, which also includes other limitations. I hope in the future I will able to find a good solution for this (or maybe I will pay for it...).

You can check out a brief tutorial by clicking on:  

https://r-inthelab.net/2021/09/23/heatmap-maker-shiny-app/

Thank you so much for your time.  

Juan Pablo Carreón Hidalgo

<jpch_26@outlook.com>  
<https://twitter.com/JuanPa2601>

[GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html)